Includes = {
	"coat_of_arms/coat_of_arms_pattern.fxh"
}

PixelShader =
{	
	MainCode PS_Pattern
	{
		Input = "VS_OUTPUT_COA_ATLAS"
		Output = "PDX_COLOR"
		Code
		[[
			PDX_MAIN
			{
				float4 MaskTex = PdxTex2D( MaskMap, Input.uvPattern );


				float4 PatternTex = PdxTex2D( PatternMap, Input.uvPattern );
				float4 PatternColor = Pattern( Input, PatternTex );
				
				PatternColor.rgb = GetOverlay( PatternColor.rgb, vec3( MaskTex.b ), 0.2 );
				
				//PatternColor.a *= MaskTex.g * 2;
				return PatternColor;
			}
		]]
	}
}

Effect coa_create_colored_pattern
{
	VertexShader = VertexShaderCOAPattern
	PixelShader = PS_Pattern
}

Effect coa_create_colored_pattern_blend
{
	VertexShader = VertexShaderCOAPattern
	PixelShader = PS_Pattern
	BlendState = BlendStateNoAlpha
}
