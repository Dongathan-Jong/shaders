vec3 sdfSquare(vec2 uv, float size, vec2 offset) {
    float x = uv.x - offset.x;
    float y = uv.y - offset.y;
    float d = max(abs(x), abs(y)) - size;
    
    return d > 0. ? vec3(1.) : vec3(1., 0., 0.);
    
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 uv = fragCoord/iResolution.xy; 
    uv -= 0.5;
    uv.x *= iResolution.x/iResolution.y;

    vec2 offset = vec2(0.0, 0.0);

    vec3 col = sdfSquare(uv, 0.2, offset);

    fragColor = vec4(col,1.0);
}
