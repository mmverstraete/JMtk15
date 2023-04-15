using JMtk15
using Documenter

DocMeta.setdocmeta!(JMtk15, :DocTestSetup, :(using JMtk15); recursive=true)

makedocs(;
    modules=[JMtk15],
    authors="Michel Verstraete <MMVerstraete@gmail.com> and contributors",
    repo="https://github.com/mmverstraete/JMtk15.jl/blob/{commit}{path}#{line}",
    sitename="JMtk15.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
deploydocs(; repo="github.com/mmverstraete/JMtk15.jl", push_preview=true)
