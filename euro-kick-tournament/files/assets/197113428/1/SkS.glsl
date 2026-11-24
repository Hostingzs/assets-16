uniform vec3 SkCA;
uniform vec3 SkCB;
uniform vec3 SkCC;
uniform vec3 AC;
uniform float AI;
uniform float OtZ;
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW);

    float NDotL=dot(dNormalW,-light0_direction);
    float Light=mix(0.3,1.0,smoothstep(0.1,0.15,NDotL));
    float Rim=smoothstep(0.4,0.41,Dot);
    
    float Outline=smoothstep(OtZ,OtZ+0.01,Dot);
    vec3 Colors=((SkCA*8.0)*smoothstep(0.5,1.0,vVertexColor.r))+((SkCB*20.0)*smoothstep(0.0,1.0,vVertexColor.g))+((SkCC*20.0)*smoothstep(0.95,1.0,vVertexColor.b));
    vec3 RimLight=smoothstep(0.3,0.4,Dot)*Colors*1.5;
    float Aura=smoothstep(0.2,1.0,Dot);
    dEmission=mix(mix(Colors*Light+RimLight,AC*4.0,Aura*AI),vec3(0.0),Outline);
}

