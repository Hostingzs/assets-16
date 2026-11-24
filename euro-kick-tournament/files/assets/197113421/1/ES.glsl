uniform vec3 EC;


void getEmission() 
        {

    float Dot = 1.0-dot(dNormalW, dViewDirW);
    float emissionZ = smoothstep(0.0,0.6,Dot);
    vec3 halfV=normalize(dViewDirW+light0_direction);
    float spec=dot(halfV,dNormalW);

    vec2 PupilUv=vUv0.xy+vec2(-0.5,-0.5);
    float PupilMask=smoothstep(0.22,0.21,distance(vec2(0.0,0.0),PupilUv));
    float PupilA=smoothstep(0.2,0.1,distance(vec2(0.0,0.0),PupilUv));
    float PupilB=smoothstep(0.05,0.12,distance(vec2(0.0,0.0),PupilUv));

    vec2 ShadowAUv=vUv0.xy+vec2(-0.5,-0.2);
    float ShadowA=smoothstep(0.3,0.6,distance(vec2(0.0,0.0),ShadowAUv));

    vec2 ShadowBUv=vUv0.xy+vec2(-0.5,-0.75);
    float ShadowB=smoothstep(0.35,0.36,distance(vec2(0.0,0.0),ShadowBUv*vec2(0.8,1.0)));

    vec2 HighlightAUv=vUv0.xy+vec2(-0.42,-0.42);
    float HighlightA=smoothstep(0.07,0.06,distance(vec2(0.0,0.0),HighlightAUv));

    vec2 HighlightBUv=vUv0.xy+vec2(-0.62,-0.6);
    float HighlightB=smoothstep(0.04,0.03,distance(vec2(0.0,0.0),HighlightBUv));
    float Hightlights=HighlightA+HighlightB;

    float NDotL=dot(dNormalW,-light0_direction);
    float Light=mix(0.3,1.0,smoothstep(0.1,0.11,NDotL));
    float Rim=smoothstep(0.4,0.41,Dot);
    float RimLight=smoothstep(0.3,0.5,Dot);
    float Outline=smoothstep(0.5,0.51,Dot);

    dEmission=mix(vec3(mix(1.0,0.2,ShadowB)),EC*20.0*PupilA*(PupilB+0.05)*(ShadowA+0.05)+Hightlights,PupilMask);
}
