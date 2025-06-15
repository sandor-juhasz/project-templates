from {{ cookiecutter.owner_namespace }}.{{ cookiecutter.project_package }}.{{ cookiecutter.project_module }} import add

def test_add():
    assert add(1,2)==3
