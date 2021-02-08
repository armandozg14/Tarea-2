Shader "Custom/Lambert"
{
    Properties
    {
        _Albedo("Albedo", Color) = (1, 1, 1, 1)
        _FallOff("FallOff", Range(0, 0.5))=0.0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            #pragma surface surf MyLambert
            half4 _FallOff;

            half4 LightingCustomLambert(SurfaceOutput s, half3 lightDir, half atten)
            {
                half diff = NdotL;
                half NdotL =dot(s.Normal, lightDir);
                half4 c;
                c.rgb = s.Albedo * _LightColor0.rgb * NdotL;
                c.a = s.Alpha;
                return c;
            }

            half4 _Albedo;

        ENDCG
    }
}