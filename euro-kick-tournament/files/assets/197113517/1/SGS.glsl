uniform float iGlobalTime;
uniform vec3 SGCA;
uniform vec3 SGCB;
uniform vec3 SGCC;
uniform vec3 SLnC;   
uniform vec3 AmC; 
uniform sampler2D Prdral;
vec3 shadow ;
void getEmission() 
        {

    float Row=texture2D(Prdral, vUv0).b;
    float GrA=texture2D(Prdral, vUv0*200.0).g;
    float GrB=texture2D(Prdral, vUv0*120.0).g;
    float GrZ=mix(GrA,1.0,GrB);
    float lnZ=texture2D(Prdral, vUv0).r*(GrB+0.4);

    vec3 Gr=mix(GrZ*SGCA*2.0,GrZ*SGCB*2.0,Row);

    dEmission=(((SGCC*2.0)+Gr)+(smoothstep(0.0,1.0,lnZ))*SLnC*4.0)*AmC;
}
