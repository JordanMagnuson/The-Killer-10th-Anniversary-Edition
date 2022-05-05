learnMoreGameTrekkingCambodiaURL = "http://www.gametrekking.com/blog/cambodia-like-no-place-ive-been";
learnMoreKillingFieldsURL = "http://en.wikipedia.org/wiki/The_killing_fields";
learnMoreCambodiaURL = "http://en.wikipedia.org/wiki/Cambodia";
leaveCommentURL = "http://www.gametrekking.com/comment/reply/58#comment-form";

if (global.mercifulShot)
	instance_create_depth(0, 0, depth, oEndScreen01Mercy);
else if(global.exploded)
	instance_create_depth(0, 0, depth, oEndScreen01Explosion);
else
	instance_create_depth(0, 0, depth, oEndScreen01Killer);
	
instance_create_depth(0, 0, depth, oFadeIn);
oFadeIn.FadeIn(oColors.BLACK, 6);

//---------------------------------------------------------------
// Use camera object to handle window resizing, fullscreen, etc.
// This is different from original AS3 source code.
instance_create_depth(0,0, -1, oCamera);
//-----------