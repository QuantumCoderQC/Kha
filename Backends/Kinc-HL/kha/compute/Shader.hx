package kha.compute;

import kha.Blob;

class Shader {
	public var _shader: Pointer;

	public function new(sources: Array<Blob>, files: Array<String>) {
		_shader = kinc_compute_create_shader(sources[0].bytes.getData(), sources[0].bytes.getData().length);
	}

	public function delete(): Void {
		kinc_compute_delete_shader(_shader);
	}

	public function getConstantLocation(name: String): ConstantLocation {
		return new ConstantLocation(kinc_compute_get_constantlocation(_shader, StringHelper.convert(name)));
	}

	public function getTextureUnit(name: String): TextureUnit {
		return new TextureUnit(kinc_compute_get_textureunit(_shader, StringHelper.convert(name)));
	}

	@:hlNative("std", "kinc_compute_create_shader") static function kinc_compute_create_shader(data: hl.Bytes, length: Int): Pointer {
		return null;
	}

	@:hlNative("std", "kinc_compute_delete_shader") static function kinc_compute_delete_shader(shader: Pointer): Void {}

	@:hlNative("std", "kinc_compute_get_constantlocation") static function kinc_compute_get_constantlocation(shader: Pointer, name: hl.Bytes): Pointer {
		return null;
	}

	@:hlNative("std", "kinc_compute_get_textureunit") static function kinc_compute_get_textureunit(shader: Pointer, name: hl.Bytes): Pointer {
		return null;
	}
}
