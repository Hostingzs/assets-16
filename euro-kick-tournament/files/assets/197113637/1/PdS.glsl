uniform vec3 AmC; 
void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW);

    //float NDotL=dot(dNormalW,-light0_direction);
    //float Light=mix(0.3,1.0,smoothstep(0.1,0.15,NDotL));
    vec3 RimLight=vec3(smoothstep(0.0,1.0,Dot)*1.0)*(vVertexColor.rgb+vec3(0.5))*0.3;


    dEmission=(vVertexColor.rgb+RimLight)*AmC;
}

