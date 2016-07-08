# pakon-tlx-addons
AutoIt v3 scripts for the enhancement of TLXClientDemo, a scanning interface for the Pakon F-X35 series of 35mm film scanners.

These scripts will NOT work if AutoIt v3 is not installed on your XP VM / PC.

Download AutoIt v3 here: https://www.autoitscript.com/site/autoit/downloads/

Get updates for the master branch on Twitter: https://twitter.com/PakonTLXAddons

TLX_Reindex
===========

A script for reindexing all images in the current roll. Useful for scanning film that is not DX encoded,
or if the DX reader in your Pakon is dirty or broken. Edit the variable SaveDest to change the location that your image
files will be saved to. Default is C:\Temp

TLX_ScanPositive
================

Activates the BnW and Positive radio buttons in the Scan Settings dialog. The Positive radio button 
selects a different frame detection algorithm, making it possible to scan E-6 slide / positive film without phantom jamming.
This setting is normally only active when running TLXClientDemo with an F-235 or F-335 attached to the PC or VM. Files must 
be saved as "raw" (negative), as Kodak's color correction algorithm does strange things (at least when used with an F-135).
Saving as planar (16-bit) is not necessary, but can be helpful.

The BnW radio button may result in a slightly different final contrast curve being applied, but it is not yet certain what the exact
difference between the C41 BnW radio button and the BnW radio button is when an F-135 (plus or non-plus) is attached.

TLX_Controller
==============

Runs silently in the System Tray, providing you with shortcut keys for the sliders
in the Color Adjustment dialog.


| Key         | Function                                 |
| ----------- | ---------------------------------------- |
| Shift + Esc | Terminates the script                    |
| Right Arrow | Navigates to the next image              |
| Left Arrow  | Navigates to the previous image          |
| z           | Rotates the current image anti-clockwise |
| x           | Rotates the current image clockwise      |
| Down Arrow  | Make the current image Selected          |
| Up Arrow    | Make the current image Not Selected      |
| Insert      | Add red (subtract cyan)                  |
| Delete      | Subtract red (add cyan)                  |
| Home        | Add green (subtract magenta)             |
| End         | Subtract green (add magenta)             |
| Page Up     | Add blue (subtract yellow)               |
| Page Down   | Subtract blue (add yellow)               |
| u           | Increase brightness                      |
| j           | Decrease brightness                      |
| i           | Increase contrast                        |
| k           | Decrease contrast                        |
| o           | Increase sharpness                       |
| l           | Decrease sharpness                       |

Do not start this script until a roll has finished scanning, and has been moved from 
the scan group to the save group (the Color button is clickable).

Once you start it, the Color Adjustment window will appear and be moved to the upper
left corner of your screen. Depending on the resolution of your display (virtual or 
otherwise), this window may overlap with some of the TLX window. This will not stop 
the hotkeys from working.

Known problems with TLX_Controller
----------------------------------

If you successfully start the script, then close the Color Adjustment window, then 
reopen it, the hotkeys will not work. You will have to terminate the script, then 
start it again. Be certain it is terminated by checking the System Tray for an 
AutoIt icon. If one is present, right-click on it and click "Exit".

Notes
=====

If you are running XP in a VM, you must run these scripts from *inside* of your XP VM! You cannot run them from the host OS and
expect them to work!

Donations
---------

If you'd like to help me justify spending even more time on these things,
you can:

Buy me a beer via Paypal: KephnosAnagennao@gmail.com
