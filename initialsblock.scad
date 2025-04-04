// Parameters
initials = "SD";  

font_size = 20;     
block_width = 60;
block_depth = 40;
block_height = 10;
text_height = 1.5;     // Height of the embossed text

// Create the block
cube([block_width, block_depth, block_height]);

// Embossed text on top
translate([block_width/2, block_depth/2, block_height])
linear_extrude(height = text_height)
    text(initials, size = font_size, font = "Arial", halign = "center", valign = "center");
