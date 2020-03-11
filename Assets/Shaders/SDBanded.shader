shader "Custum/SDBanded"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        _LightSteps("Light Steps", Range(0.0, 100.0)) = 20.0
    }

    Subshader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }
        CGPROGRAM
        #pragma surface surf Banded

        half4 _Albedo;
        half _LightSteps;
        
        half4 LightingBanded(SurfaceOutput s, half3 lightDir, half atten)
        {
            half NdotL = max(0, dot(s.Normal, lightDir));
            half lightBandsMultiplier = _LightSteps/256;
            half lightBandsAddictive = _LightSteps/2;
            fixed bandedDiff = floor((NdotL * 256 + lightBandsAddictive) / _LightSteps) * lightBandsMultiplier;

            half4 c;
            c.rgb = bandedDiff * s.Albedo * _LightColor0.rgb * atten;
            c.a = s.Alpha;
            return c;
        }

        struct Input
        {
            float a;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Albedo.rgb;
        }
        ENDCG
    }
}