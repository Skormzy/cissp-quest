#!/usr/bin/env python3
"""
CISSP Quest — Textbook PDF Extraction Pipeline
Extracts text from all CISSP PDFs and organizes by domain.
"""

import fitz  # PyMuPDF
import os
import re
import sys

SOURCE_DIR = os.path.join(os.path.dirname(__file__), '..', 'source-material')
OUTPUT_DIR = os.path.join(SOURCE_DIR, 'extracted')

DOMAINS = {
    1: "Security and Risk Management",
    2: "Asset Security",
    3: "Security Architecture and Engineering",
    4: "Communication and Network Security",
    5: "Identity and Access Management",
    6: "Security Assessment and Testing",
    7: "Security Operations",
    8: "Software Development Security",
}

# ─────────────────────────────────────────────
# Book-specific chapter-to-domain mappings
# Built from TOC analysis of each PDF
# ─────────────────────────────────────────────

BOOK_CONFIGS = {
    "CISSP Exam Certification Companion": {
        "short_name": "exam-companion",
        "page_ranges": {
            0: (1, 79),     # Front matter + intro chapters
            1: (80, 181),
            2: (182, 250),
            3: (251, 337),
            4: (338, 411),
            5: (412, 496),
            6: (497, 577),
            7: (578, 652),
            8: (653, 732),
            # Chapters 11-12 are study strategies / comprehensive exam
            0: (733, 967),  # Back matter
        },
    },
    "CISSP Student Workbook 2026": {
        "short_name": "student-workbook",
        # Unusual ordering: D1, D2, D3, then D8 snippet, D4, D5, D6, D7, D8
        "page_ranges": {
            1: (24, 53),
            2: (54, 66),
            3: (67, 139),
            4: (142, 187),
            5: (188, 207),
            6: (208, 227),
            7: (228, 261),
            8: (140, 141, 262, 279),  # Two ranges for domain 8
        },
    },
    "Chapple Study Guide 10ed": {
        "short_name": "chapple-study-guide",
        # Chapters map to domains based on ISC2 outline
        "page_ranges": {
            0: (1, 141),      # Front matter, assessment test
            1: (142, 492),    # Ch 1-3: Security Governance, Personnel/Risk, BCP
            "1_extra": (493, 582),  # Ch 4: Laws, Regulations, Compliance -> D1
            2: (583, 673),    # Ch 5: Protecting Security of Assets
            3: (674, 979),    # Ch 6-7: Crypto, PKI
            "3_extra": (980, 1186),  # Ch 8-9: Security Models, Vulnerabilities
            "3_phys": (1187, 1300),  # Ch 10: Physical Security
            4: (1301, 1668),  # Ch 11-12: Network Architecture, Secure Comms
            5: (1669, 1870),  # Ch 13-14: Identity/Auth, Access Control
            6: (1871, 1962),  # Ch 15: Security Assessment and Testing
            7: (1963, 2311),  # Ch 16-18: SecOps, Incident Response, DR
            "7_extra": (2312, 2387),  # Ch 19: Investigations and Ethics -> D7 (overlaps D1)
            8: (2388, 2620),  # Ch 20-21: Software Dev, Malicious Code
        },
    },
    "Chapple Practice Tests 4ed": {
        "short_name": "chapple-practice-tests",
        "page_ranges": {
            1: (24, 61),     # Ch 1: Domain 1 questions
            2: (62, 100),    # Ch 2: Domain 2 questions
            3: (101, 139),   # Ch 3: Domain 3 questions
            4: (140, 176),   # Ch 4: Domain 4 questions
            5: (177, 214),   # Ch 5: Domain 5 questions
            6: (215, 251),   # Ch 6: Domain 6 questions
            7: (252, 287),   # Ch 7: Domain 7 questions
            8: (288, 327),   # Ch 8: Domain 8 questions
            # Ch 9-12: Mixed practice tests -> include in all domains
            "mixed": (328, 503),
            # Appendix: Answers (include with corresponding domain chapters)
            "1_answers": (505, 526),
            "2_answers": (527, 551),
            "3_answers": (552, 570),
            "4_answers": (571, 594),
            "5_answers": (595, 619),
            "6_answers": (620, 644),
            "7_answers": (645, 669),
            "8_answers": (670, 692),
            "mixed_answers": (693, 809),
        },
    },
    "Destination CISSP": {
        "short_name": "destination-cissp",
        "page_ranges": {
            0: (1, 43),      # Front matter, intro, mindset
            1: (44, 156),
            2: (157, 205),
            3: (206, 504),
            4: (505, 634),
            5: (635, 714),
            6: (715, 778),
            7: (779, 892),
            8: (893, 1021),
        },
    },
}


def identify_book(filename):
    """Match a PDF filename to its config key."""
    fname_lower = filename.lower()
    if "companion" in fname_lower or "1000" in fname_lower:
        return "CISSP Exam Certification Companion"
    elif "workbook" in fname_lower:
        return "CISSP Student Workbook 2026"
    elif "study guide" in fname_lower or ("chapple" in fname_lower and "10ed" in fname_lower):
        return "Chapple Study Guide 10ed"
    elif "practice tests" in fname_lower or ("chapple" in fname_lower and "4ed" in fname_lower):
        return "Chapple Practice Tests 4ed"
    elif "destination" in fname_lower or "witcher" in fname_lower:
        return "Destination CISSP"
    return None


def extract_book(pdf_path, book_key):
    """Extract all text from a PDF and organize by domain."""
    config = BOOK_CONFIGS[book_key]
    short_name = config["short_name"]
    page_ranges = config["page_ranges"]

    doc = fitz.open(pdf_path)
    total_pages = len(doc)
    print(f"\n{'='*60}")
    print(f"  {book_key}")
    print(f"  File: {os.path.basename(pdf_path)}")
    print(f"  Total pages: {total_pages}")
    print(f"{'='*60}")

    # Extract ALL text from every page
    all_pages_text = []
    for i in range(total_pages):
        page_text = doc[i].get_text()
        all_pages_text.append(page_text)

    full_text = "\n\n".join(all_pages_text)
    total_chars = len(full_text)
    print(f"  Total characters extracted: {total_chars:,}")

    # Create output directory
    book_dir = os.path.join(OUTPUT_DIR, short_name)
    os.makedirs(book_dir, exist_ok=True)

    # Save full text dump
    full_path = os.path.join(book_dir, "full-text.txt")
    with open(full_path, "w", encoding="utf-8") as f:
        f.write(full_text)
    print(f"  Saved: {full_path}")

    # Organize by domain
    domain_texts = {d: [] for d in range(1, 9)}
    domain_pages = {d: 0 for d in range(1, 9)}

    for key, value in page_ranges.items():
        # Determine which domain(s) this range maps to
        if isinstance(key, int):
            if key == 0:
                continue  # Front/back matter, skip
            target_domains = [key]
        elif isinstance(key, str):
            # Handle special keys like "1_extra", "3_phys", "mixed", "1_answers"
            if key == "mixed" or key == "mixed_answers":
                target_domains = list(range(1, 9))  # Include in all domains
            else:
                # Extract domain number from key like "1_extra", "3_phys", "7_extra"
                match = re.match(r"(\d+)", key)
                if match:
                    target_domains = [int(match.group(1))]
                else:
                    continue
        else:
            continue

        # Handle tuple of page ranges (for workbook domain 8 which has two ranges)
        if isinstance(value, tuple) and len(value) == 2:
            start, end = value
            ranges_to_process = [(start, end)]
        elif isinstance(value, tuple) and len(value) == 4:
            # Two page ranges: (start1, end1, start2, end2)
            ranges_to_process = [(value[0], value[1]), (value[2], value[3])]
        else:
            continue

        for start, end in ranges_to_process:
            # Convert to 0-indexed, clamp to valid range
            start_idx = max(0, start - 1)
            end_idx = min(total_pages - 1, end - 1)
            page_count = end_idx - start_idx + 1

            page_texts = []
            for i in range(start_idx, end_idx + 1):
                page_texts.append(all_pages_text[i])

            chunk = "\n\n".join(page_texts)

            for d in target_domains:
                domain_texts[d].append(chunk)
                domain_pages[d] += page_count

    # Save domain files
    for d in range(1, 9):
        if not domain_texts[d]:
            print(f"  Domain {d}: No pages mapped (skipped)")
            continue

        combined = "\n\n".join(domain_texts[d])
        domain_path = os.path.join(book_dir, f"domain{d}.txt")
        with open(domain_path, "w", encoding="utf-8") as f:
            f.write(combined)

        chars = len(combined)
        pages = domain_pages[d]
        print(f"  Domain {d} ({DOMAINS[d]}): {pages} pages, {chars:,} chars")

    doc.close()
    return {
        "book": book_key,
        "short_name": short_name,
        "total_pages": total_pages,
        "total_chars": total_chars,
        "domain_pages": domain_pages,
    }


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    pdf_files = sorted([
        f for f in os.listdir(SOURCE_DIR)
        if f.lower().endswith('.pdf')
    ])

    if not pdf_files:
        print("No PDF files found in source-material/")
        sys.exit(1)

    print(f"Found {len(pdf_files)} PDF files")
    summaries = []

    for fname in pdf_files:
        book_key = identify_book(fname)
        if not book_key:
            print(f"\nWARNING: Could not identify book: {fname}")
            continue

        pdf_path = os.path.join(SOURCE_DIR, fname)
        summary = extract_book(pdf_path, book_key)
        summaries.append(summary)

    # Print overall summary
    print(f"\n{'='*60}")
    print("  EXTRACTION SUMMARY")
    print(f"{'='*60}")
    for s in summaries:
        print(f"\n  {s['book']} ({s['short_name']})")
        print(f"    Total pages: {s['total_pages']}")
        print(f"    Total chars: {s['total_chars']:,}")
        for d in range(1, 9):
            pages = s['domain_pages'].get(d, 0)
            if pages > 0:
                print(f"    D{d}: {pages} pages")

    # Grand totals
    grand_pages = sum(s['total_pages'] for s in summaries)
    grand_chars = sum(s['total_chars'] for s in summaries)
    print(f"\n  GRAND TOTALS: {len(summaries)} books, {grand_pages:,} pages, {grand_chars:,} characters")
    print(f"  Output: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
