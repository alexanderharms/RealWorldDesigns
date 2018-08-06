use <block_edge.scad>;

// Units are meant as millimeters
width = 40;
length = 100;
film_size = 50;
height = 40;
mat = 6;
cut_loss = 0.15/2;

// separation between the cut out parts
sep = 10;

// Bottom
union(){
    translate([mat, mat]){
        square_cutloss([length, width], cut_loss);
    }
    translate([mat, 0]){
        block_edge(length, mat, mat,cut_loss, "pos", 3);
    }
    translate([mat, mat + width]){
        block_edge(length, mat, mat, cut_loss, "pos", 3);
    }
    translate([mat, mat]){
        rotate([0, 0, 90]){
            block_edge(width, mat, mat, cut_loss, "pos", 3);
        }
    }
    // Corner pieces
    translate([0,0]){
        square_cutloss([mat, mat], cut_loss);
    }
    translate([0, mat+width]){
        square_cutloss([mat, mat], cut_loss);
    }
}

// Side length 1
union() {
    translate([mat, width + 3*mat + sep]){
        square_cutloss([length, width], cut_loss);
    }
    translate([mat, 2*mat + width + sep]){
        block_edge(length, mat, mat,cut_loss, "neg", 3);
    }
    translate([mat, 3*mat + width + sep]){
        rotate([0, 0, 90]){
            block_edge(height, mat, mat, cut_loss, "neg", 3);
        }
    }
    translate([mat + 0.5*length, 3*mat + 2*width + sep]){
        block_edge(0.5*length, mat, mat, cut_loss, "neg", 3);
    }
}


// Side length 2
union() {
    translate([mat, -(width + sep)]){
        square_cutloss([length, width], cut_loss);
    }
    translate([mat, -(sep)]){
        block_edge(length, mat, mat,cut_loss, "neg", 3);
    }
    translate([mat, -(width + sep)]){
        rotate([0, 0, 90]){
            block_edge(height, mat, mat, cut_loss, "neg", 3);
        }
    }
    translate([mat + 0.5*length, -(width + sep + mat)]){
        block_edge(0.5*length, mat, mat, cut_loss, "neg", 3);
    }
}


// Side width
union() {
    translate([-(height + mat + sep), mat]){
        square_cutloss([height, width], cut_loss);
    }
    // Top layer
    translate([-(height + 2*mat + sep), 0]){
        square_cutloss([mat, width + 2*mat ], cut_loss);
    }
    translate([-(sep), mat]){
        rotate([0, 0, 90]){
            block_edge(width, mat, mat, cut_loss, "neg", 3);
        }
    }
    translate([-(sep + mat + height), 0]){
        block_edge(height, mat, mat, cut_loss, "pos", 3);
    }
    translate([-(sep + mat + height), mat + width]){
        block_edge(height, mat, mat, , cut_loss, "pos", 3);
    }
}


// Top
union() {
    translate([(length + sep + mat), mat]){
        square_cutloss([length - film_size, width], cut_loss);
    }
    translate([(length + sep + mat), 0]){
        block_edge((length-film_size), mat, mat, cut_loss, "pos", 3);
    }
    translate([(length + sep + mat), mat + width]){
        block_edge((length-film_size), mat, mat, cut_loss, "pos", 3);
    }
}
