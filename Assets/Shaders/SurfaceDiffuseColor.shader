Shader "Custom/SurfaceDiffuseColor"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
    }

    Subshader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            float4 _Albedo;
            #pragma surface surf CustumLambert

            //Light Model diffuse (Lambert)

            half4 LightingCustumLambert(SurfaceOutput s, half3 lightDir, half atten)
            {
                return 0;
            }

            struct Input 
            {
                float2 uv_MainTex;
            };
            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo;
            }
        ENDCG
    }
}