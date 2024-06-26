package kha.compute;

import kha.arrays.Float32Array;
import kha.Image;
import kha.FastFloat;
import kha.math.FastMatrix3;
import kha.math.FastMatrix4;
import kha.math.FastVector2;
import kha.math.FastVector3;
import kha.math.FastVector4;
import kha.graphics4.CubeMap;
import kha.graphics4.TextureAddressing;
import kha.graphics4.TextureFilter;
import kha.graphics4.MipMapFilter;

class Compute {
	public static function setBool(location: kha.compute.ConstantLocation, value: Bool): Void {
		kinc_compute_set_bool(location._location, value);
	}

	public static function setInt(location: kha.compute.ConstantLocation, value: Int): Void {
		kinc_compute_set_int(location._location, value);
	}

	public static function setFloat(location: kha.compute.ConstantLocation, value: FastFloat): Void {
		kinc_compute_set_float(location._location, value);
	}

	public static function setFloat2(location: kha.compute.ConstantLocation, value1: FastFloat, value2: FastFloat): Void {
		kinc_compute_set_float2(location._location, value1, value2);
	}

	public static function setFloat3(location: kha.compute.ConstantLocation, value1: FastFloat, value2: FastFloat, value3: FastFloat): Void {
		kinc_compute_set_float3(location._location, value1, value2, value3);
	}

	public static function setFloat4(location: kha.compute.ConstantLocation, value1: FastFloat, value2: FastFloat, value3: FastFloat,
			value4: FastFloat): Void {
		kinc_compute_set_float4(location._location, value1, value2, value3, value4);
	}

	public static function setVector2(location: kha.compute.ConstantLocation, value: FastVector2): Void {
		kinc_compute_set_float2(location._location, value.x, value.y);
	}

	public static function setVector3(location: kha.compute.ConstantLocation, value: FastVector3): Void {
		kinc_compute_set_float3(location._location, value.x, value.y, value.z);
	}

	public static function setVector4(location: kha.compute.ConstantLocation, value: FastVector4): Void {
		kinc_compute_set_float4(location._location, value.x, value.y, value.z, value.w);
	}

	public static function setFloats(location: kha.compute.ConstantLocation, values: Float32Array): Void {
		kinc_compute_set_floats(location._location, values.getData(), values.length);
	}

	public static function setMatrix(location: kha.compute.ConstantLocation, matrix: FastMatrix4): Void {
		kinc_compute_set_matrix(location._location, matrix._00, matrix._10, matrix._20, matrix._30, matrix._01, matrix._11, matrix._21, matrix._31,
			matrix._02, matrix._12, matrix._22, matrix._32, matrix._03, matrix._13, matrix._23, matrix._33);
	}

	public static function setMatrix3(location: kha.compute.ConstantLocation, matrix: FastMatrix3): Void {
		kinc_compute_set_matrix3(location._location, matrix._00, matrix._10, matrix._20, matrix._01, matrix._11, matrix._21, matrix._02, matrix._12,
			matrix._22);
	}

	public static function setBuffer(buffer: ShaderStorageBuffer, index: Int) {
		// Kore::Compute::setBuffer(buffer->buffer, index);
	}

	public static function setTexture(unit: TextureUnit, texture: Image, access: Access) {
		if (texture._texture != null)
			kinc_compute_set_texture(unit._unit, texture._texture, access);
		else
			kinc_compute_set_target(unit._unit, texture._renderTarget, access);
	}

	public static function setSampledTexture(unit: TextureUnit, texture: Image) {
		if (texture._texture != null)
			kinc_compute_set_sampled_texture(unit._unit, texture._texture);
		else
			kinc_compute_set_sampled_target(unit._unit, texture._renderTarget);
	}

	public static function setSampledDepthTexture(unit: TextureUnit, texture: Image) {
		kinc_compute_set_sampled_depth_target(unit._unit, texture._renderTarget);
	}

	public static function setSampledCubeMap(unit: TextureUnit, cubeMap: CubeMap) {
		if (cubeMap._texture != null)
			kinc_compute_set_sampled_cubemap_texture(unit._unit, cubeMap._texture);
		else
			kinc_compute_set_sampled_cubemap_target(unit._unit, cubeMap._renderTarget);
	}

	public static function setSampledDepthCubeMap(unit: TextureUnit, cubeMap: CubeMap) {
		kinc_compute_set_sampled_cubemap_depth_target(unit._unit, cubeMap._renderTarget);
	}

	public static function setTextureParameters(unit: TextureUnit, uAddressing: TextureAddressing, vAddressing: TextureAddressing,
			minificationFilter: TextureFilter, magnificationFilter: TextureFilter, mipmapFilter: MipMapFilter): Void {
		kinc_compute_set_texture_parameters(unit._unit, uAddressing, vAddressing, minificationFilter, magnificationFilter, mipmapFilter);
	}

	public static function setTexture3DParameters(unit: TextureUnit, uAddressing: TextureAddressing, vAddressing: TextureAddressing,
			wAddressing: TextureAddressing, minificationFilter: TextureFilter, magnificationFilter: TextureFilter, mipmapFilter: MipMapFilter): Void {
		kinc_compute_set_texture3d_parameters(unit._unit, uAddressing, vAddressing, wAddressing, minificationFilter, magnificationFilter, mipmapFilter);
	}

	public static function setShader(shader: Shader) {
		kinc_compute_set_shader(shader._shader);
	}

	public static function compute(x: Int, y: Int, z: Int) {
		kinc_compute_compute(x, y, z);
	}

	@:hlNative("std", "kinc_compute_set_bool") static function kinc_compute_set_bool(location: Pointer, value: Bool): Void {}

	@:hlNative("std", "kinc_compute_set_int") static function kinc_compute_set_int(location: Pointer, value: Int): Void {}

	@:hlNative("std", "kinc_compute_set_float") static function kinc_compute_set_float(location: Pointer, value: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_float2") static function kinc_compute_set_float2(location: Pointer, value1: FastFloat, value2: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_float3") static function kinc_compute_set_float3(location: Pointer, value1: FastFloat, value2: FastFloat,
		value3: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_float4") static function kinc_compute_set_float4(location: Pointer, value1: FastFloat, value2: FastFloat,
		value3: FastFloat, value4: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_floats") static function kinc_compute_set_floats(location: Pointer, values: Pointer, count: Int): Void {}

	@:hlNative("std", "kinc_compute_set_matrix") static function kinc_compute_set_matrix(location: Pointer, _00: FastFloat, _10: FastFloat, _20: FastFloat,
		_30: FastFloat, _01: FastFloat, _11: FastFloat, _21: FastFloat, _31: FastFloat, _02: FastFloat, _12: FastFloat, _22: FastFloat, _32: FastFloat,
		_03: FastFloat, _13: FastFloat, _23: FastFloat, _33: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_matrix3") static function kinc_compute_set_matrix3(location: Pointer, _00: FastFloat, _10: FastFloat, _20: FastFloat,
		_01: FastFloat, _11: FastFloat, _21: FastFloat, _02: FastFloat, _12: FastFloat, _22: FastFloat): Void {}

	@:hlNative("std", "kinc_compute_set_texture") static function kinc_compute_set_texture(unit: Pointer, texture: Pointer, access: Int): Void {}

	@:hlNative("std", "kinc_compute_set_target") static function kinc_compute_set_target(unit: Pointer, renderTarget: Pointer, access: Int): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_texture") static function kinc_compute_set_sampled_texture(unit: Pointer, texture: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_target") static function kinc_compute_set_sampled_target(unit: Pointer, renderTarget: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_depth_target") static function kinc_compute_set_sampled_depth_target(unit: Pointer,
		renderTarget: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_cubemap_texture") static function kinc_compute_set_sampled_cubemap_texture(unit: Pointer,
		texture: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_cubemap_target") static function kinc_compute_set_sampled_cubemap_target(unit: Pointer,
		renderTarget: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_sampled_cubemap_depth_target") static function kinc_compute_set_sampled_cubemap_depth_target(unit: Pointer,
		renderTarget: Pointer): Void {}

	@:hlNative("std", "kinc_compute_set_texture_parameters") static function kinc_compute_set_texture_parameters(unit: Pointer, uAddressing: Int,
		vAddressing: Int, minificationFilter: Int, magnificationFilter: Int, mipmapFilter: Int): Void {}

	@:hlNative("std", "kinc_compute_set_texture3d_parameters") static function kinc_compute_set_texture3d_parameters(unit: Pointer, uAddressing: Int,
		vAddressing: Int, wAddressing: Int, minificationFilter: Int, magnificationFilter: Int, mipmapFilter: Int): Void {}

	@:hlNative("std", "kinc_compute_set_shader") static function kinc_compute_set_shader(shader: Pointer): Void {}

	@:hlNative("std", "kinc_compute_compute") static function kinc_compute_compute(x: Int, y: Int, z: Int): Void {}
}
