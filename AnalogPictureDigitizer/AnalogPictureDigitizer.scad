use <block_edge.scad>;

// Units are meant as millimeters
width = 40;
length = 100;
film_size = 50;
height = 40;
mat = 5;

block_width = (width - 2*mat)/3;
block_length = (length - 2*mat)/5;

// separation between the cut out parts
sep = 10;

// Bottom
union(){
    translate([mat, mat]){
        square([length, width]);
    }
    translate([mat, 0]){
        block_edge(length, mat, mat, "pos", 3);
    }
    translate([mat, mat + width]){
        block_edge(length, mat, mat, "pos", 3);
    }
    translate([mat, mat]){
        rotate([0, 0, 90]){
            block_edge(width, mat, mat, "pos", 3);
        }
    }
    // Corner pieces
    translate([0,0]){
        square([mat, mat]);
    }
    translate([0, mat+width]){
        square([mat, mat]);
    }
}

// Side length 1
union() {
    translate([mat, width + 3*mat + sep]){
        square([length, width]);
    }
    translate([mat, 2*mat + width + sep]){
        block_edge(length, mat, mat, "neg", 3);
    }
    translate([mat, 3*mat + width + sep]){
        rotate([0, 0, 90]){
            block_edge(height, mat, mat, "neg", 3);
        }
    }
    translate([mat + 0.5*length, 3*mat + 2*width + sep]){
        block_edge(0.5*length, mat, mat, "neg", 3);
    }
}


// Side length 2
union() {
    translate([mat, -(width + sep)]){
        square([length, width]);
    }
    translate([mat, -(sep)]){
        block_edge(length, mat, mat, "neg", 3);
    }
    translate([mat, -(width + sep)]){
        rotate([0, 0, 90]){
            block_edge(height, mat, mat, "neg", 3);
        }
    }
    translate([mat + 0.5*length, -(width + sep + mat)]){
        block_edge(0.5*length, mat, mat, "neg", 3);
    }
}


// Side width
union() {
    translate([-(height + mat + sep), mat]){
        square([height, width]);
    }
    // Top layer
    translate([-(height + 2*mat + sep), 0]){
        square([mat, width + 2*mat ]);
    }
    translate([-(sep + 0.0001), mat]){
        rotate([0, 0, 90]){
            block_edge(width, mat, mat, "neg", 3);
        }
    }
    translate([-(sep + mat + height), 0]){
        block_edge(height, mat, mat, "pos", 3);
    }
    translate([-(sep + mat + height), mat + width]){
        block_edge(height, mat, mat, "pos", 3);
    }
}


// Top
union() {
    translate([(length + sep), mat]){
        square([length - film_size, width]);
    }
    translate([(length + sep), 0]){
        block_edge((length-film_size), mat, mat, "pos", 3);
    }
    translate([(length + sep), mat + width]){
        block_edge((length-film_size), mat, mat, "pos", 3);
    }
}
