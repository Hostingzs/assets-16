
uniform vec3 C;
uniform sampler2D Prdral;

void getEmission() 
    {

    float Ui=texture2D(Prdral, vUv0).r;
    dEmission=vec3(Ui*10.0)*C;
}
