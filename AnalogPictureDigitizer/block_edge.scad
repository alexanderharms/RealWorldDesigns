module square_cutloss(size, cut_loss) {
    
    translate([-cut_loss, -cut_loss]){
        square([size[0]+2*cut_loss, size[1]+2*cut_loss]);
    }
}
module block_edge(length, height, border, cut_loss, pos_neg, num_blocks_input){
    
    div_by_2 = num_blocks_input % 2;
    num_blocks = (div_by_2 == 0) ? num_blocks_input+1 : num_blocks_input;
    
    block_length = (length - 2*border)/num_blocks;
    
    if (pos_neg == "pos"){
        // Borders
        square_cutloss([border, height], cut_loss);
        translate([length - border, 0]){
            square_cutloss([border, height], cut_loss);
        }
        // Blocks
        for (idx = [1:2:num_blocks-1]){
            translate([border + (idx)*block_length, 0]){
                square_cutloss([block_length, height], cut_loss);
            }
        }
    }
    else if (pos_neg == "neg"){
        // No borders
        // Blocks
        for (idx = [0:2:num_blocks-1]){
            translate([border + (idx)*block_length, 0]){
                square_cutloss([block_length, height], cut_loss);
            }
        }
    }
    
}

block_edge(10, 1, 1, 0, "pos", 5);