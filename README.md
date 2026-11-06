# Disable Skin Attachments

**Note:** This mod is not recommended, use [Optional Skin Attachments](https://github.com/ncakes/PD2-Optional-Skin-Attachments) instead. Optional Skin Attachments manages attachments on skins properly, so your weapon is not reset when changing skins and you still have access to skin-included attachments.

## Overview

This mod removes weapon attachments from all skins except for locked first-generation legendary skins (i.e. those with legendary attachments). It also allows weapons to be renamed when using legendary skins.

Warning: DSA does not do any DLC validation on weapons you have already crafted. If you have an unowned DLC attachment obtained via a skin, you should remove it yourself before changing skins. Otherwise you will get marked for using unowned DLC attachments without the skin.

DSA will not run if Optional Skin Attachments or Super Duper Skin Swapper is detected.

## How it works

When applying a skin, the game resets your weapon to use the skin attachments if the skin has a `default_blueprint`. When you remove the skin, the game then resets your gun and removes all attachments. Early solutions to this problem (e.g. Disabled Skin Included Modifications) simply deleted `default_blueprint` from every skin. Unfortunately this has a side effect which can cause false-positive cheat detection on other players.

A skin's `default_blueprint` is also used for content verification. A player is allowed to use DLC attachments included in a skin regardless of whether or not the player owns the DLC. Without `default_blueprint`, the game can no longer verify whether a player gained access to an attachment through a skin and you may incorrectly flag them for cheating. For legendary attachments this is an even bigger problem: legendary attachments are programmed to always trigger the anticheat and there is no way to obtain them apart from using the skin. Old versions of DSA solved this by making a backup of each skin's `default_blueprint` before deleting, then overriding the content verification check to use the backup. DSA 2.0 instead temporarily suppresses skin blueprints during weapon customization. This technique originated in Super Duper Skin Swapper 3.0; DSA 2.0 is based on SDSS 3.2.2.

DSA makes a list of all base-game skins which contain attachments, except for customize-locked first-generation legendary skins. When entering weapon customization, DSA temporarily dereferences the `default_blueprint` of all skins in this list. When leaving weapon customization, DSA restores the references. This makes the game behave as if the skins have no attachments while in weapon customization, so you can switch skins freely without losing attachments. While `default_blueprint` is dereferenced, DSA forces the `NetworkPeer:_verify_content()` function to return `true` for weapon mods. This prevents the game from doing actual content verification when `default_blueprint` is unavailable, avoiding false-positive cheat detection. Custom weapon skins are client-sided and not used for content verification, so DSA just deletes the `default_blueprint` directly.

DSA also contains handling to ensure weapon attachments are refunded to your inventory when selling weapons or when a skin is automatically removed. DSA specifically does not handle first-generation legendary skins. Removing attachments from first-generation legendary skins would require validating legendary attachments on existing crafted weapons, and there would also be no way to use legendary attachments going forward. DSA also does not validate DLC attachments on weapons crafted before installing the mod.

In contrast, SDSS 3.2.2 uses a more advanced implementation that contains additional logic for validating attachments. SDSS detects if legendary attachments or unowned DLC attachments are present on a weapon when changing skins. If so, the weapon is reset to default. The other main difference is that SDSS removes attachments from all skins, including first-generation legendary skins.

## Installation

This mod requires [SuperBLT](https://superblt.znix.xyz).

Download `Disable-Skin-Attachments_<ver>.zip` from the [latest release page](https://github.com/ncakes/PD2-Disable-Skin-Attachments/releases/latest) and extract the entire contents to your `mods` folder.

```
C:\Program Files (x86)\Steam\steamapps\common\PAYDAY 2\mods
```

## Acknowledgments

This mod was inspired by >:3/Pawcio1337's Disabled Skin Included Modifications and Customizable Legendary Skins mods.
