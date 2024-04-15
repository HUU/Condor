from enum import Enum

from fastapi import FastAPI
from pydantic import BaseModel

# not used, creates a valid OpenAPI spec but the Dart generator doesn't support OneOf's
# from griblet.fastapi_extensions import OneOfIntEnum

app = FastAPI()


# spell-checker: disable
class FartVariety(str, Enum):
    toot = "Toooot"
    brap = "Brap"
    thrrrrp = "thrrrrp"
    bwompff = "BWOMPFF"
    blart = "BLART"
    shart = "Shart"


# spell-checker: enable


class Fart(BaseModel):
    owner: str
    smell_level: int
    variety: FartVariety


class FoobarResponse(BaseModel):
    message: str
    farts: list[Fart]


@app.get("/foobar", response_model=FoobarResponse, operation_id="foobar")
def foobar():
    return FoobarResponse(
        message="Hello World",
        farts=[
            # spell-checker: disable
            Fart(owner="Jimmy", smell_level=3, variety=FartVariety.thrrrrp),
            Fart(owner="Josh", smell_level=5, variety=FartVariety.brap),
            Fart(owner="Matt", smell_level=9, variety=FartVariety.toot),
            # spell-checker: enable
        ],
    )
