{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "types-urllib3";
  version = "1.26.8";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qg3iaJPxOFI9VVK7sCOCbAzH6ldJ2AwWk8V6q3tV9Gk=";
  };

  # Module doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "urllib3-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for urllib3";
    homepage = "https://github.com/python/typeshed";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
