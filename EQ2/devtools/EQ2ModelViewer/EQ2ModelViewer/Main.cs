using System;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections.Generic;

using SlimDX;
using SlimDX.D3DCompiler;
using SlimDX.Direct3D11;
using SlimDX.DXGI;
using SlimDX.Windows;
using Device = SlimDX.Direct3D11.Device;
using Resource = SlimDX.Direct3D11.Resource;
using Buffer = SlimDX.Direct3D11.Buffer;

using Everquest2.Util;
using Everquest2.Visualization;
using System.IO;

namespace EQ2ModelViewer
{
    public partial class frmMain : Form
    {
        private System.Collections.Generic.List<Model> m_Models = new System.Collections.Generic.List<Model>();
        private GraphicClass Graphics = new GraphicClass();
        public Model SelectedModel = null;
        private string ZoneFile;
        private bool Render3DAspect = true;
        private bool AutoExportOnLoad = false;
        private String AutoLoadFileName = "";
        public frmMain()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void CleanUp()
        {
            foreach (Model model in m_Models)
                model.ShutDown();

            if (Graphics != null)
                Graphics.ShutDown();
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            CleanUp();
        }

        private CameraClass camera;
        private void frmMain_Load(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            Graphics.Initialize(pGraphics);

            /*LightShaderClass lightShader = new LightShaderClass();
            lightShader.Initialize(Graphics.Device);*/

            camera = new CameraClass();
            // Initialize a base view matrix for 2D rendering
            camera.SetPosition(0.0f, 0.0f, -1.0f);
            camera.Render();
            Matrix baseViewMatrix = camera.GetViewMatrix();

            // now set the cameras starting position
            camera.SetPosition(0.0f, 1.50f, -3.0f);

            PositionClass position = new PositionClass();
            position.SetPosition(0.0f, 1.50f, -3.0f);

            InputClass input = new InputClass();
            input.Initialize(this);

            TimerClass timer = new TimerClass();
            timer.Initialize();

            FPSClass fps = new FPSClass();
            fps.Initialize();

            TextClass text = new TextClass();
            text.Initialize(Graphics.Device, Graphics.Context, pGraphics.ClientSize.Width, pGraphics.ClientSize.Height, baseViewMatrix);

            BitmapClass bmp = new BitmapClass();
            bmp.Initialize(Graphics.Device, pGraphics.ClientSize.Width, pGraphics.ClientSize.Height, "Background.bmp", 145, 220, baseViewMatrix);
            
            string[] args = Environment.GetCommandLineArgs();
            if (args.Length > 1)
            {
                for (int i = 1; i < args.Length; i++)
                {
                    string cmd = args[i].ToLower();
                    if (cmd.Equals("norender"))
                    {
                        Render3DAspect = false;
                    }
                    else if (cmd.Equals("export"))
                    {
                        AutoExportOnLoad = true;
                    }
                    else
                    {
                        AutoLoadFileName = args[i];
                        break;
                    }
                }
            }

            if (AutoLoadFileName.Length > 0)
                LoadZoneFile(AutoLoadFileName);
            if (AutoExportOnLoad)
                exportToolStripMenuItem_Click(null, EventArgs.Empty);

            if (!Render3DAspect)
            {
                Application.Exit();
                return;
            }
            //  FrustumClass frustum = new FrustumClass();
            try
            {
                MessagePump.Run(this, () =>
                {
                    if (!Graphics.SwapChain.Disposed) {
                        timer.Frame();
                        fps.Frame();

                        // Input code
                        input.Frame();

                        position.SetFrameTime(timer.GetTime());

                        if (this.Focused)
                        {
                            if (input.IsKeyPressed(SlimDX.DirectInput.Key.LeftShift) ||
                            input.IsKeyPressed(SlimDX.DirectInput.Key.RightShift))
                                position.m_ShiftDown = true;
                            else
                                position.m_ShiftDown = false;

                            position.TurnLeft(input.IsLeftPressed());
                            position.TurnRight(input.IsRightPressed());
                            position.MoveForward(input.IsUpPressed());
                            position.MoveBackward(input.IsDownPressed());
                            position.MoveUpward(input.IsAPressed());
                            position.MoveDownward(input.IsZPressed());
                            position.LookUpward(input.IsPgUpPressed());
                            position.LookDownward(input.IsPgDownPressed());

                            if (input.IsLeftMousePressed())
                            {
                                TestIntersection(input.GetMouseX(), input.GetMouseY());
                            }

                            if (SelectedModel != null)
                            {
                                if (input.IsKeyPressed(SlimDX.DirectInput.Key.Delete))
                                {
                                    m_Models.Remove(SelectedModel);
                                    SelectedModel = null;
                                }
                                else if (input.IsKeyPressed(SlimDX.DirectInput.Key.Escape))
                                {
                                    SelectedModel = null;
                                }
                            }
                        }

                        camera.SetPosition(position.GetPosition());
                        camera.SetRotation(position.GetRotation());

                        // Render Code
                        Graphics.BeginScene();

                        // 3D
                        // View matrix
                        camera.Render();

                        //frustum.ConstructFrustum(1000.0f, Graphics.GetProjectionMatrix(), camera.GetViewMatrix());

                        foreach (Model model in m_Models) {
                            //if (frustum.CheckSphere(model.Position.X, model.Position.Y, model.Position.Z, 10.0f))
                            //{
                            /*Matrix temp = Matrix.Multiply(Graphics.GetWorldMatrix(), Matrix.Scaling(model.Scale, model.Scale, model.Scale));
                            temp = Matrix.Multiply(temp, Matrix.RotationYawPitchRoll(model.Rotation.X, model.Rotation.Y, model.Rotation.Z));
                            temp = Matrix.Multiply(temp, Matrix.Translation(model.Position.X, model.Position.Y, model.Position.Z));*/
                            model.Render(Graphics, camera, (model == SelectedModel)/*Graphics.Context*/);
                            //lightShader.Render(Graphics.Context, model.GetIndexCount(), temp, camera.GetViewMatrix(), Graphics.GetProjectionMatrix(), model.GetTexture(), new Vector3(0.0f, 0.0f, 0.0f), new Vector4(1.0f, 1.0f, 1.0f, 1.0f), new Vector4(0.0f, 0.0f, 0.0f, 0.0f), camera.GetPosition(), new Vector4(0.0f, 0.0f, 0.0f, 0.0f), 0.0f);
                            //}
                        }

                        // 2D
                        Graphics.TurnZBufferOff();
                        Graphics.TurnOnAlphaBlending();

                        bmp.Render(Graphics, 10, 10);

                        text.SetFPS(fps.GetFPS(), Graphics.Context);
                        text.SetPosition(position.GetPosition(), Graphics.Context);
                        text.SetSelectedModel(SelectedModel, Graphics.Context);
                        text.Render(Graphics.Context, Graphics.GetWorldMatrix(), Graphics.GetOrthoMatrix());

                        Graphics.TurnOffAlphaBlending();
                        Graphics.TurnZBufferOn();

                        Graphics.EndScene();
                    }
                });
            }
            catch (Exception exception) { }
        }

        public bool TestIntersection(int mouseX, int mouseY) {
            float pointX, pointY;
            Matrix projectionMatrix, viewMatrix, inverseViewMatrix;

            projectionMatrix = Graphics.GetProjectionMatrix();
            pointX = (2.0F * (float)mouseX / (float)pGraphics.ClientSize.Width - 1.0f) / projectionMatrix.M11;
            pointY = (-2.0f * (float)mouseY / (float)pGraphics.ClientSize.Height + 1.0f) / projectionMatrix.M22;
            Ray ray = new Ray(new Vector3(), new Vector3(pointX, pointY, 1.0f));

            viewMatrix = camera.GetViewMatrix();
            inverseViewMatrix = Matrix.Invert(viewMatrix);
            ray = new Ray(Vector3.TransformCoordinate(ray.Position, inverseViewMatrix), Vector3.TransformNormal(ray.Direction, inverseViewMatrix));
            ray.Direction.Normalize();

            float selectionDistance = 0.0f;
            foreach (Model model in m_Models) {
                float distance = model.TestIntersection(ray, Graphics);
                if (distance > 0.0f && (selectionDistance == 0.0f || distance < selectionDistance)) {
                    selectionDistance = distance;
                    SelectedModel = model;
                }
            }

            return false;
        }

        public static void AppendLoadFile(String txt)
        {
            StreamWriter sw = File.AppendText("loaded.txt");
            sw.WriteLine(txt);
            sw.Close();
        }

        private void loadZoneToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LoadZoneFile();
        }

        private void LoadZoneFile(String filename="")
        {
            bool isDrawFile = false;

            string fullName = "";
            String dirName = "";
            if (filename.Length < 1)
            {
                OpenFileDialog fd = new OpenFileDialog();
                fd.Filter = "lut/draw files (*.lut;*.draw)|*.lut;*.draw|lut files (*.lut)|*.lut|draw files (*.draw)|*.draw";
                if (fd.ShowDialog() == DialogResult.OK)
                {
                    AppendLoadFile("===================================================");
                    AppendLoadFile("Loading " + fd.FileName);

                    if (fd.FileName.EndsWith(".draw"))
                    {
                        isDrawFile = true;
                        string temp = fd.FileName.Substring(0, fd.FileName.LastIndexOf("\\"));
                        ZoneFile = fd.SafeFileName.Substring(0, fd.SafeFileName.IndexOf(".draw"));
                        fullName = ZoneFile;
                        dirName = temp;
                        filename = fd.FileName;
                    }
                    else
                    {
                        string temp = fd.FileName.Substring(0, fd.FileName.IndexOf("zones"));
                        ZoneFile = fd.SafeFileName.Substring(0, fd.SafeFileName.IndexOf(".lut"));
                        fullName = ZoneFile;
                        dirName = temp;
                        filename = fd.FileName;
                    }
                }
            }
            else
            {
                if (filename.EndsWith(".draw"))
                {
                    isDrawFile = true;
                    string temp = filename.Substring(0, filename.LastIndexOf("\\"));
                    ZoneFile = filename.Substring(0, filename.IndexOf(".draw"));
                    fullName = filename;
                    dirName = temp;
                }
                else
                {
                    string temp = filename.Substring(0, filename.IndexOf("zones"));
                    ZoneFile = filename.Substring(0, filename.IndexOf(".lut"));
                    fullName = filename;
                    dirName = temp;
                }
            }

            if (isDrawFile)
            {
                Model tmpModel = new Model();
                string[] textures = new string[1];
                textures[0] = "goblin_ice.dds";
                tmpModel.Initialize(Graphics.Device, filename, textures);
                tmpModel.Position.X = 0;
                tmpModel.Position.Y = 0;
                tmpModel.Position.Z = 0;
                tmpModel.Rotation.X = 0;
                tmpModel.Rotation.Y = 0;
                tmpModel.Rotation.Z = 0;
                tmpModel.Scale = 1;
                tmpModel.WidgetID = 1;
                tmpModel.GridID = 1;
                m_Models.Add(tmpModel);
                return;
            }

            if (fullName.Length < 1)
            {
                MessageBox.Show("No filename provided for loading a zonefile!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
                System.IO.BinaryReader reader2 = new System.IO.BinaryReader(new System.IO.FileStream(filename, System.IO.FileMode.Open, System.IO.FileAccess.Read));
                // Image(2020): Was ReadUint32, qey_harbor.lut however has 00 1F 00 7A, so that as an int32 is a very large number!
                reader2.ReadUInt32();
                do
                {
                    if (reader2.BaseStream.Position + 2 >= reader2.BaseStream.Length)
                    {
                        break;
                    }
                    UInt16 size = reader2.ReadUInt16();
                    string file = new string(reader2.ReadChars(size));

                    // was duplicating drive name
                    file = file.Replace("/", "\\");

                    file = dirName + file;
                    AppendLoadFile("VOC Loading: " + file);

                    Eq2Reader reader = new Eq2Reader(new System.IO.FileStream(file, System.IO.FileMode.Open, System.IO.FileAccess.Read));
                    VeNode venode = reader.ReadNodeObject();

                    CheckNode(dirName, venode);

                    //MessageBox.Show("Done!");

                    // 16 bytes between file names, grid id's maybe?
                    reader2.ReadBytes(16);
                } while (true);
            }

        float x, y, z = 0;
        float yaw, pitch, roll = 0;
        float scale = 0;
        UInt32 widgetID;
        UInt32 GridID;
        bool flipStatus = false;
        private void CheckNode(string temp, object item)
        {
            if (item is VeMeshGeometryNode)
            {
                widgetID = ((VeNode)item).WidgetID;

                // testing antonica spires which are not oriented correctly
                if ( widgetID == 2990295910 )
                {
                    int test = 0;
                }
                Model model = new Model();
                model.Initialize(Graphics.Device, (VeMeshGeometryNode)item, temp);
                model.Position.X = x;
                model.Position.Y = y;
                model.Position.Z = z;
                model.Rotation.X = yaw;
                model.Rotation.Y = pitch;
                model.Rotation.Z = roll;
                model.Scale = scale;
                model.WidgetID = widgetID;
                model.GridID = GridID;
                m_Models.Add(model);
            }
            else
            {
                float x1 = 0.0f;
                float y1 = 0.0f;
                float z1 = 0.0f;
                if (item is VeRoomItemNode)
                {
                    yaw = ((VeRoomItemNode)item).orientation[0];
                    pitch = ((VeRoomItemNode)item).orientation[1];
                    roll = ((VeRoomItemNode)item).orientation[2];
                    GridID = ((VeRoomItemNode)item).myId_grid;
                }
                else if (item is VeXformNode)
                {
                    x1 = ((VeXformNode)item).position[0];
                    y1 = ((VeXformNode)item).position[1];
                    z1 = ((VeXformNode)item).position[2];

                    yaw = (((VeXformNode)item).orientation[0]) * (3.141592654f / 180.0f);
                    pitch = (((VeXformNode)item).orientation[1]) * (3.141592654f / 180.0f);
                    roll = (((VeXformNode)item).orientation[2]) * (3.141592654f / 180.0f);
                    scale = ((VeXformNode)item).scale;

                    x += x1;
                    y += y1;
                    z += z1;
                }
                if (item != null)
                {
                    System.Collections.IEnumerator enumerator = ((VeNode)item).EnumerateChildren();
                    while (enumerator.MoveNext())
                    {
                        CheckNode(temp, enumerator.Current);
                    }
                    x -= x1;
                    y -= y1;
                    z -= z1;
                }
            }
        }

        public static string[] GetTextureFile(string[] spPath, string basePath)
        {
            string ret = "goblin_ice.dds";
            System.Collections.Generic.List<string> strings = new System.Collections.Generic.List<string>();

            int i = 0;
            while (i < spPath.Length /*&& ret == "goblin_ice.dds"*/)
            {
                Eq2Reader reader = new Eq2Reader(new System.IO.FileStream(basePath + spPath[i], System.IO.FileMode.Open, System.IO.FileAccess.Read));
                VeBase sp = reader.ReadObject();
                reader.Close();

                if (sp is VeShaderPalette)
                {
                    bool found = false;
                    for (int s = 0; s < ((VeShaderPalette)sp).shaderNames.Length; s++)
                    {
                        String fileName = basePath + ((VeShaderPalette)sp).shaderNames[s];
                        fileName = fileName.Replace("/", "\\");
                        System.IO.StreamReader reader2 = new System.IO.StreamReader(fileName);
                        while (!reader2.EndOfStream)
                        {
                            string lineOrig = reader2.ReadLine();
                            if (lineOrig.Contains("name = \"@tex") && !lineOrig.Contains("Blend") && !lineOrig.Contains("UVSet"))
                            {
                                String line = reader2.ReadLine();
                                while (line.Length < 1)
                                    line = reader2.ReadLine();

                                line = line.Substring(line.IndexOf('"') + 1);
                                line = line.Substring(0, line.Length - 1);
                                ret = basePath + line;
                                strings.Add(ret);
                                found = true;
                                break;
                                //break;
                            }
                            if (found)
                                break;
                        }
                        reader2.Close();
                    }
                }
                i++;
            }

            if (strings.Count == 0)
                strings.Add(ret);


            return strings.ToArray();
        }

        private void exportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //List<Vector3> MasterVertexList = new List<Vector3>();
            Dictionary<UInt32, List<Vector3>> MasterVertexList = new Dictionary<UInt32, List<Vector3>>();
            foreach (Model model in m_Models)
            {
                if  (model.WidgetID == 1253219127)
                {
                    int test = 0;
                }
                List<Vector3> VertexList = model.GetVertices();
                UInt32 grid = model.GridID;

                if (!MasterVertexList.ContainsKey(grid))
                    MasterVertexList[grid] = new List<Vector3>();

                List<Vector3> convertedVertices = new List<Vector3>();
                foreach(Vector3 vect in VertexList)
                {
                    Quaternion rotation = Quaternion.RotationYawPitchRoll(model.Rotation.X, model.Rotation.Y, model.Rotation.Z);
                    var matrix = Matrix.Identity;
                    Matrix.RotationQuaternion(ref rotation, out matrix);
                    Matrix scaled = Matrix.Multiply(matrix, Matrix.Scaling(model.Scale, model.Scale, model.Scale));

                    Vector3 result = Vector3.Add(Vector3.TransformNormal(vect, scaled), model.Position);
                    convertedVertices.Add(result);
                }
                MasterVertexList[grid].AddRange(convertedVertices);
            }

            float minX = float.NaN;
            float minZ = float.NaN;
            float maxX = float.NaN;
            float maxZ = float.NaN;
            foreach (KeyValuePair<UInt32, List<Vector3>> entry in MasterVertexList)
            {
                foreach (Vector3 v in entry.Value)
                {
                    if (float.IsNaN(minX))
                    {
                        minX = v.X;
                        maxX = v.X;
                        minZ = v.Z;
                        maxZ = v.Z;
                    }
                    else
                    {
                        if (v.X < minX)
                            minX = v.X;
                        if (v.X > maxX)
                            maxX = v.X;
                        if (v.Z < minZ)
                            minZ = v.Z;
                        if (v.Z > maxZ)
                            maxZ = v.Z;
                    }
                }
            }


            using (StreamWriter file = new StreamWriter(ZoneFile + ".obj"))
            {
                //   file.WriteLine(ZoneFile);
                //  file.WriteLine("Min");
                //   file.WriteLine(minX + " " + minZ);
                //  file.WriteLine("Max");
                //  file.WriteLine(maxX + " " + maxZ);

                //  file.WriteLine("Grid count");
                //  file.WriteLine(MasterVertexList.Count);
                //  file.WriteLine();

                List<string> indices = new List<string>();
                int count = 0;
                string buildStr = "";
                int curcount = 0;
                foreach (KeyValuePair<UInt32, List<Vector3>> entry in MasterVertexList)
                {
                    buildStr = "f ";
                   // file.WriteLine("Grid");
                   // file.WriteLine(entry.Key);

                   // file.WriteLine("Face count");
                   // file.WriteLine(entry.Value.Count);
                    foreach (Vector3 v in entry.Value)
                    {
                        if (curcount > 2)
                        {
                            buildStr += count;
                            indices.Add(buildStr);
                            buildStr = "f ";
                            curcount = 0;
                        }
                        else
                            buildStr += count + " ";

                        file.WriteLine("v " + v.X.ToString() + " " + v.Y.ToString()
                            + " " + v.Z.ToString());
                        count++;
                        curcount++;
                    }
                }
                foreach (string str in indices)
                {
                    file.WriteLine(str);
                }
                file.Close();
            }

            using (BinaryWriter file = new BinaryWriter(File.Open(ZoneFile + ".EQ2Map", FileMode.Create)))
            {
                file.Write(ZoneFile);
                file.Write(minX);
                file.Write(minZ);
                file.Write(maxX);
                file.Write(maxZ);
                file.Write(MasterVertexList.Count);
                foreach (KeyValuePair<UInt32, List<Vector3>> entry in MasterVertexList)
                {
                    file.Write(entry.Key);
                    file.Write(entry.Value.Count);
                    foreach (Vector3 v in entry.Value)
                    {
                        file.Write(v.X);
                        file.Write(v.Y);
                        file.Write(v.Z);
                    }
                }
                file.Close();
            }
            if (sender != null)
               MessageBox.Show("Export Complete!");
        }
    }
}
