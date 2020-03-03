﻿Shader "Custum/RimliteColorShader"
{
    Properties
    {
        [HDR]_RimColor("Rim Color", Color) = (1, 0, 0 , 1)
        _RimPower("Rim Power", Range(0.0, 0.8)) = 1.0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            #pragma surface surf Lambert

            half3 _RimColor;
            float _RimPower;

            struct Input
            {
                float3 viewDir;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                float3 nVD = normalize(IN.viewDir);
                half NdbtV = dot(nVD, o.Normal);
                half rim = 1 - saturate(NdbtV);
                o.Emission = _RimColor.rgb * pow(rim, _RimPower);
            }

        ENDCG
    }
}