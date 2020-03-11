Shader "Custom/SDCustumLambert"
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
                half NdotL = dot(s.Normal, lightDir);
                half4 c;
                c.rgb = s.Albedo * _LightColor0.rgb * NdotL * atten;
                c.a = s.Alpha;
                return c;
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