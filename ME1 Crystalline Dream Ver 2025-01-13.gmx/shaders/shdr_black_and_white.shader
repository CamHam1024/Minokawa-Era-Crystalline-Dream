//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main(){
    vec4 basecol = texture2D(gm_BaseTexture, v_vTexcoord); // Incoming pixel color to variable.
    float grey = dot(basecol.rgb, vec3(0.333)); // Dot product, or: red * 0.333 + green * 0.333 + blue * 0.333.
    grey = floor(grey * 8.0); // Color values are 0-1, so flooring the multiplication turns everything below 0.5 to 0 and 0.5 or above to 1.
    gl_FragColor = vec4(vec3(grey), 1.0); // Output the pixel.
}
