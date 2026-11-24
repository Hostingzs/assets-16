
uniform vec3 KSCA;
uniform vec3 KSCB;
uniform float Pw;
uniform sampler2D Prdral;
uniform float iGlobalTime;
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW)*0.5;
    float Lime=smoothstep(0.0,0.2,Dot);
    float Lime2=smoothstep(0.2,0.8,Dot)*1.5;
    vec2 uvZ=vUv0;
    float Shld=texture2D(Prdral, (vUv0*1.0)+vec2(0.0,iGlobalTime*0.5)).b*1.5;


    dEmission=(((KSCA*10.0)*smoothstep(0.25,1.0,Shld))+(Lime2*(KSCB*10.0)))*Pw;
}


