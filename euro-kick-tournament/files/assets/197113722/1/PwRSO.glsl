
uniform float Pw;
uniform sampler2D Prdral2;
uniform float iGlobalTime;
uniform float FW;
void getOpacity() 
{
    float UiRing=texture2D(Prdral2, vUv0).r*4.0;
    float Wave=texture2D(Prdral2,(vUv0*1.5)+vec2(0.0,iGlobalTime)).b*3.0;
    float UiGradient=smoothstep(Pw,Pw+0.15,texture2D(Prdral2, vUv0).g)*(UiRing*smoothstep(0.0,0.15,1.0-texture2D(Prdral2, vUv0).g));
    dAlpha=UiGradient*(mix(1.0,Wave,FW))*UiRing;
}
