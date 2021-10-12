dsc_resource 'Hello-World-File-Exists' do
    resource :File
    property :Ensure, 'Present'
    property :DestinationPath, 'C:\Temp\HelloWorld.txt'
    property :Contents, 'Hello World! This file was created by chef using DSC & Azure Pipelines'
  end
  