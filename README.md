# pakon-tlx-addons
AutoIt v3 scripts for the enhancement of TLXClientDemo, a scanning interface for the Pakon F-X35 series of 35mm film scanners.

Download AutoIt v3 here: https://www.autoitscript.com/site/autoit/downloads/

TLX_Reindex - A script for reindexing all images in the current roll. Useful for scanning film that is not DX encoded,
or if the DX reader in your Pakon is dirty or broken. Edit the variable SaveDest to change the location that your image
files will be saved to. Default is C:\Temp

TLX_ScanPositive - Activates the BnW and Positive radio buttons in the Scan Settings dialog. The Positive radio button 
selects a different frame detection algorithm, making it possible to scan E-6 slide / positive film without phantom jamming.
This setting is normally only active when running TLXClientDemo with an F-235 or F-335 attached to the PC or VM. The BnW
radio button may result in a slightly different final contrast curve being applied, but it is not yet certain what the exact
difference between the C41 BnW radio button and the BnW radio button is when an F-135 (plus or non-plus) is attached.
