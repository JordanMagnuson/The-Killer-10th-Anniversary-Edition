x = room_width/2 + 68;
y = room_height/2 + 68;

fallSpeed = 0.5;

instance_create_depth(0,0,0, oView);
oView.View(self, [0,0, room_width, 1200], 1);