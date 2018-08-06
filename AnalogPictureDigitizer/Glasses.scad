use <block_edge.scad>;

film_height = 50;
width = 80;
cut_loss = 0.15/2;
sep = 10;
brackets_height = 3;
image_width = 36;
image_height = 24;

difference() {
    square_cutloss([width, film_height], cut_loss);
    translate([0.5*width - 0.5*(image_width - 2*cut_loss),  0.5*image_height - brackets_height]){ 
        square([image_width - 2*cut_loss, brackets_height - 2*cut_loss]);
    }
}


translate([0, film_height + sep]) {
    difference() {
        square_cutloss([width, film_height], cut_loss);
        translate([0.5*width - 0.5*(image_width - 2*cut_loss), 0.5*image_height - brackets_height]){ 
        square([image_width - 2*cut_loss, brackets_height - 2*cut_loss]);
        }
    }

}