from {{ cookiecutter.python_package }}.{{ cookiecutter.python_module }} import add

def test_add():
    assert add(1,2)==3
