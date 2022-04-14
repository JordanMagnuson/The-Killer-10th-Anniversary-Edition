FADE_IN_DURATION = 3;
FADE_OUT_DURATION = 3;
started = false;
fade = false;
text = "";
draw_set_font(fntFont);

x = 20;
y = 100;
alpha = 0;

if(global.touchedPlains)
{
	text = "Just a little bit further";
}
else switch(global.numberOfStops)
{
	case 0:
		text = "You haven't gone far enough";
		break;
	case 1:
		text = "Continue to the fields";
		break;
	case 2:
		text = "There are fields ahead";
		break;
	default:
		text = "The fields are beyond the beach.";
		break;
}

function nextText(){
	instance_create_depth(0, 0, 0, oTextLetGo);
}

fadein = true;

function fadeOut(){
	fade = true;
}

function destroy(){
	instance_destroy(oTextPress);
}