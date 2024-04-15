from enum import IntEnum

from pydantic import GetJsonSchemaHandler
from pydantic.json_schema import JsonSchemaValue
from pydantic_core import core_schema as cs


# self documenting BUT it doesn't work with the Dart code generator, oh well
class OneOfIntEnum(IntEnum):
    @classmethod
    def __get_pydantic_json_schema__(
        cls, core_schema: cs.CoreSchema, handler: GetJsonSchemaHandler
    ) -> JsonSchemaValue:
        json_schema = handler(core_schema)
        json_schema = handler.resolve_ref_schema(json_schema)
        del json_schema["enum"]
        json_schema["oneOf"] = [
            {"title": enum.name, "const": enum.value} for enum in list(cls)
        ]
        return json_schema
