x = 0;
y = 0;
sprite_index = sprMusicChoiceScreen;

instance_create_depth(0,0,0, oColors);

instance_create_depth(0,0,0, oMusicSelectorButton);
oMusicSelectorButton.MusicSelectorButton(81, 128);

instance_create_depth(0,0,0, oAmbientSelectorButton);
oAmbientSelectorButton.AmbientSelectorButton(341, 128);

//---------------------------------------------------------------
// Use camera object to handle window resizing, fullscreen, etc.
// This is different from original AS3 source code.
instance_create_depth(0,0, -1, oCamera);
//---------------------------------------------------------------