uniform vec3 CpCA;
uniform vec3 CpCB;
uniform vec3 CpCC;
uniform vec3 CpCD;
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    vec3 spec=(dot(halfV,dNormalW))*CpCD;

    float NDotL=dot(dNormalW,-light0_direction);
    float Light=mix(0.3,1.0,smoothstep(0.1,0.11,NDotL));
    float Rim=smoothstep(0.4,0.41,Dot);
    
    float Outline=smoothstep(0.5,0.51,Dot);
    vec3 Colors=((CpCA*4.0+spec)*vVertexColor.r)+((CpCB*4.0)*vVertexColor.g)+((CpCC*4.0+spec)*vVertexColor.b);
    vec3 RimLight=smoothstep(0.3,0.6,Dot)*Colors*1.0;
    float RimZ=smoothstep(0.6,0.61,Dot);
    dEmission=mix(Colors*Light+RimLight,vec3(0.25,0.25,0.25),RimZ);
}


