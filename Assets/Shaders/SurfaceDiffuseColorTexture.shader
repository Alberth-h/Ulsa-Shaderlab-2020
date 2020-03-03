Shader "Custom/SurfaceDiffuseColor"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
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
            half4 _Albedo;
            sampler2D _MainTex;
            #pragma surface surf Lambert
            struct Input 
            {
                float2 uv_MainTex;
            };
            void surf (Input IN, inout SurfaceOutput o)
            {
                half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
                o.Albedo = _Albedo * texColor.rgb;
            }
        ENDCG
    }
}