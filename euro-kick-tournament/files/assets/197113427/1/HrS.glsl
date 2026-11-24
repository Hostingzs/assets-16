
uniform vec3 HrC;
uniform float OtZ;
uniform vec3 AC;
uniform float AI;
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW);

    float NDotL=dot(dNormalW,-light0_direction);
    float Light=mix(0.3,1.0,smoothstep(0.1,0.15,NDotL));
    vec3 RimLight=smoothstep(0.2,0.4,Dot)*HrC*4.0;
    float Outline=smoothstep(OtZ,OtZ+0.01,Dot);
    float Aura=smoothstep(0.2,1.0,Dot);
    dEmission=mix(mix((((HrC*2.0)*vVertexColor.rgb)*Light)+RimLight,AC*4.0,Aura*AI),vec3(0.0),Outline);
}

