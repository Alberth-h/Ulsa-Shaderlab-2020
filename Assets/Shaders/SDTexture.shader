Shader "Custom/SDTexture"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white"{}
    }

    Subshader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            sampler2D _MainTex;
            #pragma surface surf Lambert
            struct Input 
            {
                float2 uv_MainTex;
            };
            void surf (Input IN, inout SurfaceOutput o)
            {
                half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
            }
        ENDCG
    }
}