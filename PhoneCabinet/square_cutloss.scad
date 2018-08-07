module square_cutloss(size, cut_loss, center=false) {
    
    translate([-cut_loss, -cut_loss]){
        square([size[0]+2*cut_loss, size[1]+2*cut_loss], center);
    }
}

module square_cutloss_neg(size, cut_loss, center=false) {
    square([size[0] - 2*cut_loss, size[1] - 2*cut_loss], center);
}
