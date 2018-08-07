use <block_edge.scad>;
use <square_cutloss.scad>;

mat = 6;
cut_loss = 0.15/2;

num_levels = 6; // at least 2.
num_gaps = num_levels - 1;

width = 110;
depth = 180;
height_level = 30;
height_cabinet = num_levels*height_level + (num_levels - 1)*mat;
back_gap = 0.4;
side_gap = 0.6;
side_teeth = 1;
upper_teeth = 5;
upper_teeth_short = 3;

//// Back panel
difference() {
    union() {
        square_cutloss([width, height_cabinet], cut_loss, center=true);
        
        // Upper tooth
        translate([-0.5*width, 0.5*height_cabinet]){
            block_edge(width, mat, mat, cut_loss, "neg", upper_teeth_short);
        }
        
        // Lower tooth
        translate([-0.5*width, -0.5*height_cabinet - mat]){
            block_edge(width, mat, mat, cut_loss, "neg", upper_teeth_short);
        }
        
        // Left teeth
        for (idx = [-num_levels/2 : 1 : (num_levels/2 - 1)]){
            translate([-0.5*width, idx * (1/num_levels) * height_cabinet]){
                rotate([0, 0, 90]){
                    block_edge((1/num_levels)*height_cabinet, mat, mat, cut_loss, "neg", side_teeth);
                }
            }
        }
        
        // Right teeth
        for (idx = [-num_levels/2 : 1 : (num_levels/2 - 1)]){
            translate([0.5*width + mat, idx * (1/num_levels) * height_cabinet]){
                rotate([0, 0, 90]){
                    block_edge((1/num_levels)*height_cabinet, mat, mat, cut_loss, "neg", side_teeth);
                }
            }
        }        
    }

for (idx = [-(floor(num_gaps/2)) : 1 : floor(num_gaps/2)]){
    translate([0, idx * (1/num_levels) * height_cabinet]){
    square_cutloss_neg([back_gap*width, mat], cut_loss, center=true);
    }
}
}

//// Side panel 1
translate([0.5 * width + 0.5 * depth + 4*mat, 0]){
    difference() {
        union() {
            square_cutloss([depth, height_cabinet], cut_loss, center=true);
            
            // Upper tooth
            translate([-0.5*depth, 0.5*height_cabinet]){
                block_edge(depth, mat, mat, cut_loss, "neg", upper_teeth);
            }
            
            // Lower tooth
            translate([-0.5*depth, -0.5*height_cabinet - mat]){
                block_edge(depth, mat, mat, cut_loss, "neg", upper_teeth);
            }
            
            // Left teeth
            for (idx = [-num_levels/2 : 1 : (num_levels/2 - 1)]){
                translate([-0.5*depth, idx * (1/num_levels) * height_cabinet]){
                    rotate([0, 0, 90]){
                        block_edge((1/num_levels)*height_cabinet, mat, mat, cut_loss, "pos", side_teeth);
                    }
                }
            }
               
    }

    for (idx = [-(floor(num_gaps/2)) : 1 : floor(num_gaps/2)]){
        translate([0, idx * (1/num_levels) * height_cabinet]){
        square_cutloss_neg([side_gap*depth, mat], cut_loss, center=true);
        }
    }
    }
}

//// Side panel 2
translate([-(0.5 * width + 0.5 * depth + 4*mat), 0]){
    difference() {
        union() {
            square_cutloss([depth, height_cabinet], cut_loss, center=true);
            
            // Upper tooth
            translate([-0.5*depth, 0.5*height_cabinet]){
                block_edge(depth, mat, mat, cut_loss, "neg", upper_teeth);
            }
            
            // Lower tooth
            translate([-0.5*depth, -0.5*height_cabinet - mat]){
                block_edge(depth, mat, mat, cut_loss, "neg", upper_teeth);
            }
            
            // Left teeth
            for (idx = [-num_levels/2 : 1 : (num_levels/2 - 1)]){
                translate([-0.5*depth, idx * (1/num_levels) * height_cabinet]){
                    rotate([0, 0, 90]){
                        block_edge((1/num_levels)*height_cabinet, mat, mat, cut_loss, "pos", side_teeth);
                    }
                }
            }
               
    }

    for (idx = [-(floor(num_gaps/2)) : 1 : floor(num_gaps/2)]){
        translate([0, idx * (1/num_levels) * height_cabinet]){
        square_cutloss_neg([side_gap*depth, mat], cut_loss, center=true);
        }
    }
    }
}

//// Top
translate([-0.5*width, 0.5*height_cabinet + 5*mat]){
    union() {
        square_cutloss([width, depth], cut_loss);
        translate([0, -mat]){
            block_edge(width, mat, mat, cut_loss, "pos", upper_teeth_short);
        }
        rotate([0, 0, 90]){
            block_edge(depth, mat, mat, cut_loss, "pos", upper_teeth);
        }
        translate([width+mat, 0]){
            rotate([0, 0, 90]){
                block_edge(depth, mat, mat, cut_loss, "pos", upper_teeth);
            }
        }
        translate([-mat, -mat]){
            square_cutloss([mat, mat], cut_loss);
        }
        translate([width, -mat]){
            square_cutloss([mat, mat], cut_loss);
        }
    }
}

//// Bottom
translate([(0.5 * width + 4 * mat), 0.5*height_cabinet + 5*mat]){
    union() {
        square_cutloss([width, depth], cut_loss);
        translate([0, -mat]){
            block_edge(width, mat, mat, cut_loss, "pos", upper_teeth_short);
        }
        rotate([0, 0, 90]){
            block_edge(depth, mat, mat, cut_loss, "pos", upper_teeth);
        }
        translate([width+mat, 0]){
            rotate([0, 0, 90]){
                block_edge(depth, mat, mat, cut_loss, "pos", upper_teeth);
            }
        }
        translate([-mat, -mat]){
            square_cutloss([mat, mat], cut_loss);
        }
        translate([width, -mat]){
            square_cutloss([mat, mat], cut_loss);
        }
    }
}

//// Panels 
for (idx = [0 : 1 : (num_levels - 2)]) {
    translate([idx * (width + 4*mat), -(0.5*height_cabinet + depth + 4*mat)]) {
        union() {
            translate([0.5*(1-back_gap)*width , -mat]) {
                square_cutloss([back_gap*width, mat], cut_loss);
            }
            square_cutloss([width, depth], cut_loss);
            translate([0, 0.5*(1 - side_gap)*depth]) {
                rotate([0, 0, 90]){
                    square_cutloss([side_gap*depth, mat], cut_loss);
                }
            }
            translate([width + mat, 0.5*(1 - side_gap)*depth]) {
                rotate([0, 0, 90]){
                    square_cutloss([side_gap*depth, mat], cut_loss);
                }
            }
            
        }
    }
}

