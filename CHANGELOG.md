# Changelog

## v2.0

*2026-11-06 - Update 248.2*

- Removed all options. DSA now always does the following:
	- Attachments are removed from all skins (including custom skins), except for locked first-generation legendary skins (i.e. those with legendary attachments).
	- First-generation legendary skins are managed by the base game.
		- Applying a first-generation legendary skin will use the skin's attachments.
		- Removing a first-generation legendary skin will reset your gun to default attachments.
		- First-generation legendary skins remain partially customize-locked and can only change certain attachments.
		- Legendary attachments retain their base-game stats.
	- Weapons can always be renamed when using legendary skins.
- DSA automatically disables itself if Optional Skin Attachments or Super Duper Skin Swapper is detected.
- Reworked attachment removal to use a temporary suppression while in weapon customization (as in SDSS).

## v1.2

*2020-03-26 - Update 199 Mark II Hotfix 2*

- Reworked method for validating weapon modifications for compatibility with latest update.

## v1.1

*2020-01-02 - Update 199*

- Fixed a bug in the base game where weapons could not be renamed even after the legendary skin was removed.
- Reworked code for renaming legendary skins.

## v1.0

*2019-08-15 - Update 197.2*

- Initial release.
