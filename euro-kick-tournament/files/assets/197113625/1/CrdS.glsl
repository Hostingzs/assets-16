uniform float Offset;
uniform sampler2D Prdral;
uniform sampler2D Prdral2;

uniform vec3 AmC; 
uniform vec3 ShC;
uniform vec3 PnC;
uniform vec3 SkC;

void getEmission() 
        {
    float A1=texture2D(Prdral, vUv0+vec2(0.0,Offset)).r;   
    float A2=texture2D(Prdral, vUv0+vec2(0.0,Offset)).g;
    float A3=texture2D(Prdral, vUv0+vec2(0.0,Offset)).b;

    float B1=texture2D(Prdral2, vUv0+vec2(0.0,Offset)).r;   
    float B2=texture2D(Prdral2, vUv0+vec2(0.0,Offset)).g;
    float B3=texture2D(Prdral2, vUv0+vec2(0.0,Offset)).b;

    vec3 Shirt=(ShC*A1)*3.0;
    vec3 Pants=(PnC*A2)*3.0;
    vec3 Skin=(SkC*A3)*3.0;

    dEmission=((Shirt+Skin+Pants)+vec3(B1-A1))*(AmC);//mix(mix((Shirt+Skin+Pants),vec3(1.0),1.0-B1),vec3(0.1),B2);
}
