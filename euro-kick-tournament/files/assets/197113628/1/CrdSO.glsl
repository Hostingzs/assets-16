
uniform float Offset2;
uniform sampler2D Prdral3;
uniform sampler2D Prdral4;
void getOpacity() 
{
    float A1=texture2D(Prdral3, vUv0+vec2(0.0,Offset2)).r;  
    float A2=texture2D(Prdral3, vUv0+vec2(0.0,Offset2)).g;  
    float A3=texture2D(Prdral3, vUv0+vec2(0.0,Offset2)).b;  
    float B1=texture2D(Prdral4, vUv0+vec2(0.0,Offset2)).r;  
    float B2=texture2D(Prdral4, vUv0+vec2(0.0,Offset2)).g; 
    float B3=texture2D(Prdral4, vUv0+vec2(0.0,Offset2)).b; 
    float Opacity=A1+A2+A3+B1+B2+B3;

    dAlpha=smoothstep(0.4,0.41,Opacity)*5.0;
}

