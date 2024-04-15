import argparse
import json
import pathlib
import sys

from uvicorn.importer import import_from_string

parser = argparse.ArgumentParser(prog="save-openapi.py")
parser.add_argument("app", help='App import string. Eg. "api:app"')
parser.add_argument("--app-dir", help="Directory containing the app", default=None)
parser.add_argument("--out", help="Output file ending", default="openapi.json")

if __name__ == "__main__":
    args = parser.parse_args()

    if args.app_dir is not None:
        print(f"adding {args.app_dir} to sys.path")
        sys.path.insert(0, args.app_dir)

    print(f"Importing app from {args.app}")
    app = import_from_string(args.app)
    openapi = app.openapi()
    version = openapi.get("openapi", "unknown version")

    print(f"Writing OpenAPI spec v{version}")
    pathlib.Path(args.out).parents[0].mkdir(parents=True, exist_ok=True)
    with open(args.out, "w") as f:
        json.dump(openapi, f, indent=2)

    print(f"Spec written to {args.out}")
