uniform vec3 BCA;
uniform vec3 BCB;
uniform vec3 BCC;
uniform vec3 AC;
uniform float AuraIntensity;
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW);

    float NDotL=dot(dNormalW,-light0_direction);
    float Light=mix(0.3,1.0,smoothstep(0.1,0.11,NDotL));
    float Lime=smoothstep(0.4,0.41,Dot);
    
    float Outline=smoothstep(0.5,0.61,Dot);
    vec3 Colors=((BCA*4.0)*smoothstep(0.95,1.0,vVertexColor.r))+((BCB*4.0)*smoothstep(0.95,1.0,vVertexColor.g))+((BCC*4.0)*smoothstep(0.2,0.5,vVertexColor.b));
    float LimeLight=smoothstep(0.2,1.0,Dot)*4.0;
    float Aura=smoothstep(0.5,1.0,Dot);
    dEmission=mix(mix(Colors*Light+LimeLight,AC*4.0,Aura*AuraIntensity),vec3(0.0),Outline);
}

