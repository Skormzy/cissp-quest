export type AvatarGender = 'Man' | 'Woman' | 'Non-binary';
export type DbGender = 'male' | 'female' | 'nonbinary';

export type PronounSubject = 'he' | 'she' | 'they';
export type PronounObject = 'him' | 'her' | 'them';
export type PronounPossessive = 'his' | 'her' | 'their';
export type PronounReflexive = 'himself' | 'herself' | 'themself';

export interface PronounSet {
  subject: PronounSubject;
  object: PronounObject;
  possessive: PronounPossessive;
  reflexive: PronounReflexive;
}

export interface PlayerProfileTokens {
  display_name: string;
  pronoun_subject: string;
  pronoun_object: string;
  pronoun_possessive: string;
  pronoun_reflexive: string;
}

export function avatarGenderToDb(g: AvatarGender): DbGender {
  switch (g) {
    case 'Man': return 'male';
    case 'Woman': return 'female';
    case 'Non-binary': return 'nonbinary';
  }
}

export function dbGenderToAvatar(g: DbGender): AvatarGender {
  switch (g) {
    case 'male': return 'Man';
    case 'female': return 'Woman';
    case 'nonbinary': return 'Non-binary';
  }
}

export function defaultPronounsFor(g: AvatarGender): PronounSet {
  switch (g) {
    case 'Man':
      return { subject: 'he', object: 'him', possessive: 'his', reflexive: 'himself' };
    case 'Woman':
      return { subject: 'she', object: 'her', possessive: 'her', reflexive: 'herself' };
    case 'Non-binary':
      return { subject: 'they', object: 'them', possessive: 'their', reflexive: 'themself' };
  }
}

function capitalize(s: string): string {
  if (!s) return s;
  return s.charAt(0).toUpperCase() + s.slice(1);
}

// Function-form replacements are intentional: pronoun and name fields are user
// input. String.prototype.replace interprets $&, $1, $$ in a string replacement
// argument; the function form does not. Do not "simplify" these back to strings.
export function substituteTokens(text: string, profile: PlayerProfileTokens): string {
  return text
    .replace(/\{playerName\}/g, () => profile.display_name)
    .replace(/\{pronoun\}/g, () => profile.pronoun_subject)
    .replace(/\{Pronoun\}/g, () => capitalize(profile.pronoun_subject))
    .replace(/\{pronounObject\}/g, () => profile.pronoun_object)
    .replace(/\{pronounPossessive\}/g, () => profile.pronoun_possessive)
    .replace(/\{PronounPossessive\}/g, () => capitalize(profile.pronoun_possessive))
    .replace(/\{pronounReflexive\}/g, () => profile.pronoun_reflexive);
}
