/// @description generate clouds
var padding = 220;
for (var i = 0; i < (room_width div padding);i++) {
	for (var j = 0; j < (room_height div padding); j++) {
		if (irandom(4) < 2) {
			var inst = instance_create_layer(i*padding+random_range(32,96),j*padding+random_range(32,96),"Instances",obj_cloud);
		}
	}
}