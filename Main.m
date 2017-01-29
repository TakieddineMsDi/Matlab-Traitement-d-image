function varargout = Main(varargin)
% MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 15-Dec-2015 07:44:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in MPBTransformation.
function MPBTransformation_Callback(hObject, eventdata, handles)
    set(handles.MPTransformation,'Visible','on');
    set(handles.MPRestoration,'Visible','off');
    set(handles.MPRehaussement,'Visible','off');
    set(handles.MPSegmentation,'Visible','off');

% hObject    handle to MPBTransformation (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPBRestauration.
function MPBRestauration_Callback(hObject, eventdata, handles)
    set(handles.MPTransformation,'Visible','off');
    set(handles.MPRestoration,'Visible','on');
    set(handles.MPRehaussement,'Visible','off');
    set(handles.MPSegmentation,'Visible','off');

% hObject    handle to MPBRestauration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPBRehaussement.
function MPBRehaussement_Callback(hObject, eventdata, handles)
    set(handles.MPTransformation,'Visible','off');
    set(handles.MPRestoration,'Visible','off');
    set(handles.MPRehaussement,'Visible','on');
    set(handles.MPSegmentation,'Visible','off');
    
% hObject    handle to MPBRehaussement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPBSegmentation.
function MPBSegmentation_Callback(hObject, eventdata, handles)
    set(handles.MPTransformation,'Visible','off');
    set(handles.MPRestoration,'Visible','off');
    set(handles.MPRehaussement,'Visible','off');
    set(handles.MPSegmentation,'Visible','on');

% hObject    handle to MPBSegmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBSelect.
function MPTPBSelect_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Import', ...
   'MultiSelect', 'on');
if ~isequal(filename,0)
   if isequal(class(filename),'char')
      List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesPaths,'string',List_Strings);
   else
       [n,m] = size(filename);
       for i=1 : m
          List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
          New_Item=filename{1,i};
          List_Strings{end+1}=New_Item;
          set(handles.MPTLBImagesSrcs,'string',List_Strings);
          List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
          New_Item=pathname;
          List_Strings{end+1}=New_Item;
          set(handles.MPTLBImagesPaths,'string',List_Strings);
       end
   end
   New_List_String_Srcs = [];
   New_List_String_Paths = [];
   List_Strings_Srcs = cellstr(get(handles.MPTLBImagesSrcs,'string'));
   List_Strings_Paths = cellstr(get(handles.MPTLBImagesPaths,'string'));
   [k,s] = size(List_Strings_Srcs);
   i = 1;
   for p = 1 : k
      if ~isequal(List_Strings_Srcs{p},'')
        New_List_String_Srcs{i} = List_Strings_Srcs{p};
        New_List_String_Paths{i} = List_Strings_Paths{p};
        i = i+1;
      end
   end
   set(handles.MPTLBImagesSrcs,'value',[]);
   set(handles.MPTLBImagesPaths,'value',[]);
   set(handles.MPTLBImagesSrcs,'string',New_List_String_Srcs);
   set(handles.MPTLBImagesPaths,'string',New_List_String_Paths);
end
%imshow(A,'Parent',handles.MPTAImageSrc);
%imwrite(A, 'image2.bmp');

% hObject    handle to MPTPBSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on mouse press over axes background.
function MPTAImageSrc_ButtonDownFcn(hObject, eventdata, handles)
    [filename, user_canceled] = imsave(A);
% hObject    handle to MPTAImageSrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPTLBImagesSrcs.
function MPTLBImagesSrcs_Callback(hObject, eventdata, handles)
% hObject    handle to MPTLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPTLBImagesSrcs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPTLBImagesSrcs


% --- Executes during object creation, after setting all properties.
function MPTLBImagesSrcs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPTLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPTPBDelete.
function MPTPBDelete_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
[k,s] = size(List_Strings_Srcs);
New_List_Strings_Srcs = [];
New_List_Strings_Paths = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          List_Strings_Srcs{Selected_Index(i)} = [];
          set(handles.MPTLBImagesSrcs,'String',List_Strings_Srcs);
          set(handles.MPTLBImagesPaths,'Value',Selected_Index(i));
          List_Strings_Paths=cellstr(get(handles.MPTLBImagesPaths,'string'));
          List_Strings_Paths{Selected_Index(i)} = [];
       end
       i = 1;
       for p = 1 : k
          if ~isequal(List_Strings_Srcs{p},'')
              New_List_Strings_Srcs{i} = List_Strings_Srcs{p};
              New_List_Strings_Paths{i} = List_Strings_Paths{p};
              i = i+1;
          end
       end
       set(handles.MPTLBImagesSrcs,'value',[]);
       set(handles.MPTLBImagesPaths,'value',[]);
       set(handles.MPTLBImagesSrcs,'String',New_List_Strings_Srcs);
       set(handles.MPTLBImagesPaths,'String',New_List_Strings_Paths);
    catch ex
        
    end


% --- Executes on button press in MPTPBShow.
function MPTPBShow_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       imshow(A,'Parent',handles.MPTAImageSrc);
    catch ex
        
    end


          %imshow(A,'Parent',handles.MPTAImageSrc);
% hObject    handle to MPTPBShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBURL.
function MPTPBURL_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       set(handles.MPTSTURL,'string',Selected_ItemPaths);
    catch ex
        
    end


% --- Executes on selection change in MPTLBImagesPaths.
function MPTLBImagesPaths_Callback(hObject, eventdata, handles)
% hObject    handle to MPTLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPTLBImagesPaths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPTLBImagesPaths


% --- Executes during object creation, after setting all properties.
function MPTLBImagesPaths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPTLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPTPB2.
function MPTPB2_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A.^2;
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end


% --- Executes on button press in MPTPBSQRT.
function MPTPBSQRT_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = sqrt(double(A));
       imshow(uint8(A2),'Parent',handles.MPTAResult);

    catch ex
        
    end
% hObject    handle to MPTPBSQRT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBR.
function MPTPBR_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,1);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBG.
function MPTPBG_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,2);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBB.
function MPTPBB_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,3);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBRGB.
function MPTPBRGB_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = hsv2rgb(A);
       imshow(A2,'Parent',handles.MPTAResult);
%        [filename, pathname, filterindex] = uiputfile( ...
% {'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
%    '*.*',  'All Files (*.*)'}, ...
%  'Save as');
% if ~isequal(filename,0)
%     imwrite(A2,fullfile(pathname,filename));
%       List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
%       New_Item=filename;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesSrcs,'string',List_Strings);
%       List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
%       New_Item=pathname;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesPaths,'string',List_Strings);
% end
    catch ex
        
    end
% hObject    handle to MPTPBRGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBH.
function MPTPBH_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,1);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBS.
function MPTPBS_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,2);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBV.
function MPTPBV_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A(:,:,3);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBHSV.
function MPTPBHSV_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = rgb2hsv(A);
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        
    end
% hObject    handle to MPTPBHSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBTranspose.
function MPTPBTranspose_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = A';
       imshow(uint8(A2),'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBTranspose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBING.
function MPTPBING_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       A2 = 255-A;
       imshow(uint8(A2),'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBING (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBSH.
function MPTPBSH_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       [n,m]=size(A);
for i=1:m
    for j=1:m
        A2(i,j)=A(n-i+1,j);
    end
end
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBSH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBSC.
function MPTPBSC_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       [n,m]=size(A);
for i=1:m
    for j=1:m
        A2(i,j)=A(n-i+1,m-j+1);
    end
end
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBSC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBSV.
function MPTPBSV_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       [n,m]=size(A);
for i=1:m
    for j=1:m
        A2(i,j)=A(i,m-j+1);
    end
end
       imshow(A2,'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBSomme.
function MPTPBSomme_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
List_Strings_Paths=cellstr(get(handles.MPTLBImagesPaths,'string'));
[k,s] = size(List_Strings_Srcs);
All = [];
A2 = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          set(handles.MPTLBImagesPaths,'Value',Selected_Index(i));
          All{i} = imread(fullfile(List_Strings_Paths{Selected_Index(i)},List_Strings_Srcs{Selected_Index(i)}));
       end
       Somme = All{1};
       for i=2 : m
          Somme = Somme + All{i};
       end
       imshow(Somme,'Parent',handles.MPTAResult);
%        [filename, pathname, filterindex] = uiputfile( ...
% {'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
%    '*.*',  'All Files (*.*)'}, ...
%  'Save as');
% if ~isequal(filename,0)
%     imwrite(Somme,fullfile(pathname,filename));
%       List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
%       New_Item=filename;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesSrcs,'string',List_Strings);
%       List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
%       New_Item=pathname;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesPaths,'string',List_Strings);
% end
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBSomme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBMinus.
function MPTPBMinus_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
List_Strings_Paths=cellstr(get(handles.MPTLBImagesPaths,'string'));
[k,s] = size(List_Strings_Srcs);
All = [];
A2 = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          set(handles.MPTLBImagesPaths,'Value',Selected_Index(i));
          All{i} = imread(fullfile(List_Strings_Paths{Selected_Index(i)},List_Strings_Srcs{Selected_Index(i)}));
       end
       Somme = All{1};
       for i=2 : m
          Somme = Somme - All{i};
       end
       imshow(Somme,'Parent',handles.MPTAResult);
%        [filename, pathname, filterindex] = uiputfile( ...
% {'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
%    '*.*',  'All Files (*.*)'}, ...
%  'Save as');
% if ~isequal(filename,0)
%     imwrite(Somme,fullfile(pathname,filename));
%       List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
%       New_Item=filename;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesSrcs,'string',List_Strings);
%       List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
%       New_Item=pathname;
%       List_Strings{end+1}=New_Item;
%       set(handles.MPTLBImagesPaths,'string',List_Strings);
% end
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBMinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBOr.
function MPTPBOr_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
List_Strings_Paths=cellstr(get(handles.MPTLBImagesPaths,'string'));
[k,s] = size(List_Strings_Srcs);
All = [];
A2 = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          set(handles.MPTLBImagesPaths,'Value',Selected_Index(i));
          All{i} = imread(fullfile(List_Strings_Paths{Selected_Index(i)},List_Strings_Srcs{Selected_Index(i)}));
       end
       Somme = All{1};
       for i=2 : m
          Somme = Somme | All{i};
       end
       imshow(Somme,'Parent',handles.MPTAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBOr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBAnd.
function MPTPBAnd_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
List_Strings_Paths=cellstr(get(handles.MPTLBImagesPaths,'string'));
[k,s] = size(List_Strings_Srcs);
All = [];
A2 = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          set(handles.MPTLBImagesPaths,'Value',Selected_Index(i));
          All{i} = imread(fullfile(List_Strings_Paths{Selected_Index(i)},List_Strings_Srcs{Selected_Index(i)}));
       end
       Somme = All{1};
       for i=2 : m
          Somme = Somme & All{i};
       end
       imshow(Somme,'Parent',handles.MPTAResult);

    catch ex
        disp(ex);
    end
% hObject    handle to MPTPBAnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBUp.
function MPTPBUp_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       if ~isequal(Selected_Index,1)
          [n,m] = size(ListStringsSrcs);
          for i=1 : n
              if i+1 == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPTLBImagesSrcs,'value',[Selected_Index-1]);
   set(handles.MPTLBImagesPaths,'value',[Selected_Index-1]);
   set(handles.MPTLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPTLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end
% hObject    handle to MPTPBUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBDown.
function MPTPBDown_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPTLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPTLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPTLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       [n,m] = size(ListStringsSrcs);
       if ~isequal(Selected_Index,n)
          for i=1 : n
              if i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index+1
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPTLBImagesSrcs,'value',[Selected_Index+1]);
   set(handles.MPTLBImagesPaths,'value',[Selected_Index+1]);
   set(handles.MPTLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPTLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end
% hObject    handle to MPTPBDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRePBSelect.
function MPRePBSelect_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Import', ...
   'MultiSelect', 'on');
if ~isequal(filename,0)
   if isequal(class(filename),'char')
      List_Strings=cellstr(get(handles.MPReLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPReLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPReLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPReLBImagesPaths,'string',List_Strings);
   else
       [n,m] = size(filename);
       for i=1 : m
          List_Strings=cellstr(get(handles.MPReLBImagesSrcs,'string'));
          New_Item=filename{1,i};
          List_Strings{end+1}=New_Item;
          set(handles.MPReLBImagesSrcs,'string',List_Strings);
          List_Strings=cellstr(get(handles.MPReLBImagesPaths,'string'));
          New_Item=pathname;
          List_Strings{end+1}=New_Item;
          set(handles.MPReLBImagesPaths,'string',List_Strings);
       end
   end
   New_List_String_Srcs = [];
   New_List_String_Paths = [];
   List_Strings_Srcs = cellstr(get(handles.MPReLBImagesSrcs,'string'));
   List_Strings_Paths = cellstr(get(handles.MPReLBImagesPaths,'string'));
   [k,s] = size(List_Strings_Srcs);
   i = 1;
   for p = 1 : k
      if ~isequal(List_Strings_Srcs{p},'')
        New_List_String_Srcs{i} = List_Strings_Srcs{p};
        New_List_String_Paths{i} = List_Strings_Paths{p};
        i = i+1;
      end
   end
   set(handles.MPReLBImagesSrcs,'value',[]);
   set(handles.MPReLBImagesPaths,'value',[]);
   set(handles.MPReLBImagesSrcs,'string',New_List_String_Srcs);
   set(handles.MPReLBImagesPaths,'string',New_List_String_Paths);
end
% hObject    handle to MPRePBSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRePBDelete.
function MPRePBDelete_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
[k,s] = size(List_Strings_Srcs);
New_List_Strings_Srcs = [];
New_List_Strings_Paths = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          List_Strings_Srcs{Selected_Index(i)} = [];
          set(handles.MPReLBImagesSrcs,'String',List_Strings_Srcs);
          set(handles.MPReLBImagesPaths,'Value',Selected_Index(i));
          List_Strings_Paths=cellstr(get(handles.MPReLBImagesPaths,'string'));
          List_Strings_Paths{Selected_Index(i)} = [];
       end
       i = 1;
       for p = 1 : k
          if ~isequal(List_Strings_Srcs{p},'')
              New_List_Strings_Srcs{i} = List_Strings_Srcs{p};
              New_List_Strings_Paths{i} = List_Strings_Paths{p};
              i = i+1;
          end
       end
       set(handles.MPReLBImagesSrcs,'value',[]);
       set(handles.MPReLBImagesPaths,'value',[]);
       set(handles.MPReLBImagesSrcs,'String',New_List_Strings_Srcs);
       set(handles.MPReLBImagesPaths,'String',New_List_Strings_Paths);
    catch ex
        
    end
% hObject    handle to MPRePBDelete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRePBShow.
function MPRePBShow_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       imshow(A,'Parent',handles.MPReAImageSrc);
    catch ex
        
    end
% hObject    handle to MPRePBShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRePBURL.
function MPRePBURL_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       set(handles.MPReSTURL,'string',Selected_ItemPaths);
    catch ex
        
    end
% hObject    handle to MPRePBURL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPReLBImagesSrcs.
function MPReLBImagesSrcs_Callback(hObject, eventdata, handles)
% hObject    handle to MPReLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPReLBImagesSrcs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPReLBImagesSrcs


% --- Executes during object creation, after setting all properties.
function MPReLBImagesSrcs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPReLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRePBUp.
function MPRePBUp_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       if ~isequal(Selected_Index,1)
          [n,m] = size(ListStringsSrcs);
          for i=1 : n
              if i+1 == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPReLBImagesSrcs,'value',[Selected_Index-1]);
   set(handles.MPReLBImagesPaths,'value',[Selected_Index-1]);
   set(handles.MPReLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPReLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end



% --- Executes on button press in MPRePBDown.
function MPRePBDown_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       [n,m] = size(ListStringsSrcs);
       if ~isequal(Selected_Index,n)
          for i=1 : n
              if i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index+1
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPReLBImagesSrcs,'value',[Selected_Index+1]);
   set(handles.MPReLBImagesPaths,'value',[Selected_Index+1]);
   set(handles.MPReLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPReLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end
% hObject    handle to MPRePBDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPReLBImagesPaths.
function MPReLBImagesPaths_Callback(hObject, eventdata, handles)
% hObject    handle to MPReLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPReLBImagesPaths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPReLBImagesPaths


% --- Executes during object creation, after setting all properties.
function MPReLBImagesPaths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPReLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox6.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6


% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton50.
function pushbutton50_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRhPBSelect.
function MPRhPBSelect_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Import', ...
   'MultiSelect', 'on');
if ~isequal(filename,0)
   if isequal(class(filename),'char')
      List_Strings=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPRhLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPRhLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPRhLBImagesPaths,'string',List_Strings);
   else
       [n,m] = size(filename);
       for i=1 : m
          List_Strings=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
          New_Item=filename{1,i};
          List_Strings{end+1}=New_Item;
          set(handles.MPRhLBImagesSrcs,'string',List_Strings);
          List_Strings=cellstr(get(handles.MPRhLBImagesPaths,'string'));
          New_Item=pathname;
          List_Strings{end+1}=New_Item;
          set(handles.MPRhLBImagesPaths,'string',List_Strings);
       end
   end
   New_List_String_Srcs = [];
   New_List_String_Paths = [];
   List_Strings_Srcs = cellstr(get(handles.MPRhLBImagesSrcs,'string'));
   List_Strings_Paths = cellstr(get(handles.MPRhLBImagesPaths,'string'));
   [k,s] = size(List_Strings_Srcs);
   i = 1;
   for p = 1 : k
      if ~isequal(List_Strings_Srcs{p},'')
        New_List_String_Srcs{i} = List_Strings_Srcs{p};
        New_List_String_Paths{i} = List_Strings_Paths{p};
        i = i+1;
      end
   end
   set(handles.MPRhLBImagesSrcs,'value',[]);
   set(handles.MPRhLBImagesPaths,'value',[]);
   set(handles.MPRhLBImagesSrcs,'string',New_List_String_Srcs);
   set(handles.MPRhLBImagesPaths,'string',New_List_String_Paths);
end


% --- Executes on button press in MPRhPBDelete.
function MPRhPBDelete_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
[k,s] = size(List_Strings_Srcs);
New_List_Strings_Srcs = [];
New_List_Strings_Paths = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          List_Strings_Srcs{Selected_Index(i)} = [];
          set(handles.MPRhLBImagesSrcs,'String',List_Strings_Srcs);
          set(handles.MPRhLBImagesPaths,'Value',Selected_Index(i));
          List_Strings_Paths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
          List_Strings_Paths{Selected_Index(i)} = [];
       end
       i = 1;
       for p = 1 : k
          if ~isequal(List_Strings_Srcs{p},'')
              New_List_Strings_Srcs{i} = List_Strings_Srcs{p};
              New_List_Strings_Paths{i} = List_Strings_Paths{p};
              i = i+1;
          end
       end
       set(handles.MPRhLBImagesSrcs,'value',[]);
       set(handles.MPRhLBImagesPaths,'value',[]);
       set(handles.MPRhLBImagesSrcs,'String',New_List_Strings_Srcs);
       set(handles.MPRhLBImagesPaths,'String',New_List_Strings_Paths);
    catch ex
        
    end


% --- Executes on button press in MPRhPBShow.
function MPRhPBShow_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPRhLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       imshow(A,'Parent',handles.MPRhAImageSrc);
       imhist(A);
    catch ex
        disp(ex);
    end


% --- Executes on button press in MPRhPBURL.
function MPRhPBURL_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPRhLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       set(handles.MPRhSTURL,'string',Selected_ItemPaths);
    catch ex
        
    end


% --- Executes on selection change in MPRhLBImagesPaths.
function MPRhLBImagesPaths_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRhLBImagesPaths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRhLBImagesPaths


% --- Executes during object creation, after setting all properties.
function MPRhLBImagesPaths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MPRhLBImagesSrcs.
function MPRhLBImagesSrcs_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRhLBImagesSrcs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRhLBImagesSrcs


% --- Executes during object creation, after setting all properties.
function MPRhLBImagesSrcs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRhPBUp.
function MPRhPBUp_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       if ~isequal(Selected_Index,1)
          [n,m] = size(ListStringsSrcs);
          for i=1 : n
              if i+1 == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPRhLBImagesSrcs,'value',[Selected_Index-1]);
   set(handles.MPRhLBImagesPaths,'value',[Selected_Index-1]);
   set(handles.MPRhLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPRhLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end


% --- Executes on button press in MPRhPBDown.
function MPRhPBDown_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       [n,m] = size(ListStringsSrcs);
       if ~isequal(Selected_Index,n)
          for i=1 : n
              if i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index+1
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPRhLBImagesSrcs,'value',[Selected_Index+1]);
   set(handles.MPRhLBImagesPaths,'value',[Selected_Index+1]);
   set(handles.MPRhLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPRhLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end


% --- Executes on button press in MPRePBKNC.
function MPRePBKNC_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       H=1/9*[1 1 1;1 1 1;1 1 1];
       I=conv2(A,H);
       imshow(uint8(I),'Parent',handles.MPReAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPRePBKNC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPRePUMFs.
function MPRePUMFs_Callback(hObject, eventdata, handles)
% hObject    handle to MPRePUMFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRePUMFs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRePUMFs


% --- Executes during object creation, after setting all properties.
function MPRePUMFs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRePUMFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MPRePUMFsS.
function MPRePUMFsS_Callback(hObject, eventdata, handles)
% hObject    handle to MPRePUMFsS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRePUMFsS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRePUMFsS


% --- Executes during object creation, after setting all properties.
function MPRePUMFsS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRePUMFsS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPReESigma_Callback(hObject, eventdata, handles)
% hObject    handle to MPReESigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPReESigma as text
%        str2double(get(hObject,'String')) returns contents of MPReESigma as a double


% --- Executes during object creation, after setting all properties.
function MPReESigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPReESigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRePBPSNR.
function MPRePBPSNR_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       F = get(findall(handles.MPReAResult,'type','image'),'cdata');
       PSNR =psnr(A,F);
       set(handles.MPReEPSNR,'String',PSNR);
    catch ex
        disp(ex);
    end


% --- Executes during object creation, after setting all properties.
function MPReEPSNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPReEPSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRePBIMFNB.
function MPRePBIMFNB_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPRePUMFsS,'String'); 
       Size = contents{get(handles.MPRePUMFsS,'Value')};
       contents = get(handles.MPRePUMFs,'String'); 
       Filter = contents{get(handles.MPRePUMFs,'Value')};
       Sigma = str2double(get(handles.MPReESigma,'String'));
       I = [];
       P = [];
       switch Size 
           case '3*3'
               P = [3 3]
           case '5*5'
               disp(Size);
               P = [5 5];
           case '7*7'
               P = [7 7];
       end
               try
                   H=fspecial(Filter, P,Sigma);
               catch e
                   try
                       H=fspecial(Filter, P);
                   catch x
                       try
                          H=fspecial(Filter, Sigma);
                       catch y
                          try
                              H=fspecial(P, Sigma);
                          catch z
                       
                          end
                       end
                   end
               end
               I = imfilter(A,H);
       imshow(uint8(I),'Parent',handles.MPReAResult);
    catch ex
        disp(ex);
    end
% hObject    handle to MPRePBIMFNB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPRePUMFNoise.
function MPRePUMFNoise_Callback(hObject, eventdata, handles)
% hObject    handle to MPRePUMFNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRePUMFNoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRePUMFNoise


% --- Executes during object creation, after setting all properties.
function MPRePUMFNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRePUMFNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRePBImnoise.
function MPRePBImnoise_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPRePUMFNoise,'String'); 
       Noise = contents{get(handles.MPRePUMFNoise,'Value')};
       I = imnoise(A,Noise);
       imshow(I,'Parent',handles.MPReAResult);
    catch ex
        disp(ex);
    end



function MPReEOFOrder_Callback(hObject, eventdata, handles)
% hObject    handle to MPReEOFOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPReEOFOrder as text
%        str2double(get(hObject,'String')) returns contents of MPReEOFOrder as a double


% --- Executes during object creation, after setting all properties.
function MPReEOFOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPReEOFOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MPRePUMOFSize.
function MPRePUMOFSize_Callback(hObject, eventdata, handles)
% hObject    handle to MPRePUMOFSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPRePUMOFSize contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPRePUMOFSize


% --- Executes during object creation, after setting all properties.
function MPRePUMOFSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRePUMOFSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRePBOrdFilt2.
function MPRePBOrdFilt2_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPRePUMOFSize,'String'); 
       Size = contents{get(handles.MPRePUMOFSize,'Value')};
       Order = str2num(get(handles.MPReEOFOrder,'String'));
       I = [];
       P = [];
       switch Size 
           case '3*3'
               P = ones(3,3);
           case '5*5'
               P = ones(5,5);
           case '7*7'
               P = ones(7,7);
       end
       I = ordfilt2(A,Order,P);
       imshow(uint8(I),'Parent',handles.MPReAResult);
    catch ex
        disp(ex);
    end


% --- Executes on button press in MPRhPBHistEq.
function MPRhPBHistEq_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPRhLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       I = histeq(A);
       imshow(I,'Parent',handles.MPRhAResult);
       imhist(I);
    catch ex
        
    end


% --- Executes on button press in MPRhPBIA.
function MPRhPBIA_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPRhLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       Low = str2num(get(handles.MPRhEIALow,'String'));
       High = str2num(get(handles.MPRhEIAHigh,'String'));
       Top = str2num(get(handles.MPRhEIATop,'String'));
       Bottom = str2num(get(handles.MPRhEIABottom,'String'));
       Gamma = str2num(get(handles.MPRhEIAGamma,'String'));
       I = imadjust(A,[Low High],[Top Bottom],Gamma);
       imshow(I,'Parent',handles.MPRhAResult);
       imhist(I);
    catch ex
        
    end
% hObject    handle to MPRhPBIA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function MPRhEIALow_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhEIALow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhEIALow as text
%        str2double(get(hObject,'String')) returns contents of MPRhEIALow as a double


% --- Executes during object creation, after setting all properties.
function MPRhEIALow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhEIALow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPRhEIAHigh_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhEIAHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhEIAHigh as text
%        str2double(get(hObject,'String')) returns contents of MPRhEIAHigh as a double


% --- Executes during object creation, after setting all properties.
function MPRhEIAHigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhEIAHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPRhEIABottom_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhEIABottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhEIABottom as text
%        str2double(get(hObject,'String')) returns contents of MPRhEIABottom as a double


% --- Executes during object creation, after setting all properties.
function MPRhEIABottom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhEIABottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRhEIATop.
function MPRhEIATop_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhEIATop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MPRhEIATop


% --- Executes during object creation, after setting all properties.
function MPRhEIATop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhEIATop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in MPRhEIAGamma.
function MPRhEIAGamma_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhEIAGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MPRhEIAGamma



function MPRhERhMin_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhERhMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhERhMin as text
%        str2double(get(hObject,'String')) returns contents of MPRhERhMin as a double


% --- Executes during object creation, after setting all properties.
function MPRhERhMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhERhMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPRhERhMax_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhERhMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhERhMax as text
%        str2double(get(hObject,'String')) returns contents of MPRhERhMax as a double


% --- Executes during object creation, after setting all properties.
function MPRhERhMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhERhMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPRhERhNew_Callback(hObject, eventdata, handles)
% hObject    handle to MPRhERhNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPRhERhNew as text
%        str2double(get(hObject,'String')) returns contents of MPRhERhNew as a double


% --- Executes during object creation, after setting all properties.
function MPRhERhNew_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPRhERhNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPRhPBRh.
function MPRhPBRh_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPRhLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPRhLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPRhLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       Min = str2num(get(handles.MPRhERhMin,'String'));
       Max = str2num(get(handles.MPRhERhMax,'String'));
       New = str2num(get(handles.MPRhERhNew,'String'));
        [n,m]=size(A);
    I=double(A);
    %somme=0;
    for i=1:n
        for j=1:m
            if(I(i,j)<=Min || I(i,j)>=Max)
                I(i,j)=New;
            end
        end
    end
       imshow(uint8(I),'Parent',handles.MPRhAResult);
       imhist(uint8(I));
    catch ex
        
    end


% --- Executes on button press in MPSPBNorme.
function MPSPBNorme_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPSPUMNS,'String'); 
       Size = contents{get(handles.MPSPUMNS,'Value')};
       contents = get(handles.MPSPUMNF,'String'); 
       Filter = contents{get(handles.MPSPUMNF,'Value')};
       Sigma = str2double(get(handles.MPReESigma,'String'));
       I = [];
       P = [];
       Hx = [];
       Hy = [];
       switch Size 
           case '3*3'
               P = [3 3]
           case '5*5'
               disp(Size);
               P = [5 5];
           case '7*7'
               P = [7 7];
       end
       if isequal(Filter,'sobel')
           Hx=fspecial(Filter);
       else
               try
                   Hx=fspecial(Filter, P,Sigma);
               catch e
                   try
                       Hx=fspecial(Filter, P);
                   catch x
                       try
                          Hx=fspecial(Filter, Sigma);
                       catch y
                          try
                              Hx=fspecial(P, Sigma);
                          catch z
                       
                          end
                       end
                   end
               end
       end
               Hy=Hx';
               Gx=conv2(double(A),double(Hx));%horizontal
               Gy=conv2(double(A),double(Hy));%vertical
               I=max(abs(Gx), abs(Gy));
       imshow(uint8(I),'Parent',handles.MPSAResult);
    catch ex
        disp(ex);
    end


% --- Executes on selection change in MPSPUMEF.
function MPSPUMEF_Callback(hObject, eventdata, handles)
% hObject    handle to MPSPUMEF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSPUMEF contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSPUMEF


% --- Executes during object creation, after setting all properties.
function MPSPUMEF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSPUMEF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MPSPUMEO.
function MPSPUMEO_Callback(hObject, eventdata, handles)
% hObject    handle to MPSPUMEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSPUMEO contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSPUMEO


% --- Executes during object creation, after setting all properties.
function MPSPUMEO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSPUMEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBEdge.
function MPSPBEdge_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPSPUMEF,'String'); 
       Filter = contents{get(handles.MPSPUMEF,'Value')};
       contents = get(handles.MPSPUMEO,'String'); 
       Orie = contents{get(handles.MPSPUMEO,'Value')};
       I = edge(A,Filter,Orie);
       imshow(I,'Parent',handles.MPSAResult);
    catch ex
        disp(ex);
    end



function MPSESClass_Callback(hObject, eventdata, handles)
% hObject    handle to MPSESClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPSESClass as text
%        str2double(get(hObject,'String')) returns contents of MPSESClass as a double


% --- Executes during object creation, after setting all properties.
function MPSESClass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSESClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBS.
function MPSPBS_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       Classes = str2num(get(handles.MPSESClass,'String'));
       ListClasses=cellstr(get(handles.MPSLBSClass,'string'));
       [m,n] = size(ListClasses);
       [x,z]=size(A);
       I = [];
       for i=1 : x
           for j=1 : z
               Flag = 0;
               for p=1 : m
                   if Flag == 0
                   if p<m
                       s = ListClasses{p};
                       LCs= {} ;
                        while ~isempty(s),
                              [LCs{end+1}, s] = strtok(s, ';');
                        end
                        Op = LCs{1};
                        Val = str2num(LCs{2});
                        New = str2num(LCs{3});
                        Done = 0;
                        switch Op
                            case '>='
                                if A(i,j)>=Val
                                    Done = 1;
                                end
                            case '<='
                                if A(i,j)<=Val
                                    Done = 1;
                                end
                            case '>'
                                if A(i,j)>Val
                                    Done = 1;
                                end
                            case '<'
                                if A(i,j)<Val
                                    Done = 1;
                                end
                            case '='
                                if A(i,j)==Val
                                    Done = 1;
                                end
                        end
                        if Done == 1
                            I(i,j) = New;
                            Flag = 1;
                            break;
                        end
                   else
                       I(i,j) = str2num(ListClasses{p});
                       Flag = 1;
                       break;
                   end
                   end
               end
           end 
       end
       imshow(uint8(I),'Parent',handles.MPSAResult);
           
    catch ex
        disp(ex);
    end


% --- Executes on selection change in MPSLBSClass.
function MPSLBSClass_Callback(hObject, eventdata, handles)
% hObject    handle to MPSLBSClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSLBSClass contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSLBSClass


% --- Executes during object creation, after setting all properties.
function MPSLBSClass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSLBSClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPTPBSave.
function MPTPBSave_Callback(hObject, eventdata, handles)
I2 = get(findall(handles.MPTAResult,'type','image'),'cdata');
% rgb = [];
% f = getframe(handles.MPTAResult);
% [im,map] = frame2im(f); 
% if isempty(map)
%   rgb = im;
% else
%   rgb = ind2rgb(im,map);
% end
[filename, pathname, filterindex] = uiputfile( ...
{'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
 'Save as');
if ~isequal(filename,0)
    imwrite(I2,fullfile(pathname,filename));
      List_Strings=cellstr(get(handles.MPTLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPTLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesPaths,'string',List_Strings);
end
% hObject    handle to MPTPBSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPTPBDeselect.
function MPTPBDeselect_Callback(hObject, eventdata, handles)
       set(handles.MPTLBImagesSrcs,'value',[]);
       set(handles.MPTLBImagesPaths,'value',[]);
% hObject    handle to MPTPBDeselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBSelect.
function MPSPBSelect_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Import', ...
   'MultiSelect', 'on');
if ~isequal(filename,0)
   if isequal(class(filename),'char')
      List_Strings=cellstr(get(handles.MPSLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPSLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPSLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPSLBImagesPaths,'string',List_Strings);
   else
       [n,m] = size(filename);
       for i=1 : m
          List_Strings=cellstr(get(handles.MPSLBImagesSrcs,'string'));
          New_Item=filename{1,i};
          List_Strings{end+1}=New_Item;
          set(handles.MPSLBImagesSrcs,'string',List_Strings);
          List_Strings=cellstr(get(handles.MPSLBImagesPaths,'string'));
          New_Item=pathname;
          List_Strings{end+1}=New_Item;
          set(handles.MPSLBImagesPaths,'string',List_Strings);
       end
   end
   New_List_String_Srcs = [];
   New_List_String_Paths = [];
   List_Strings_Srcs = cellstr(get(handles.MPSLBImagesSrcs,'string'));
   List_Strings_Paths = cellstr(get(handles.MPSLBImagesPaths,'string'));
   [k,s] = size(List_Strings_Srcs);
   i = 1;
   for p = 1 : k
      if ~isequal(List_Strings_Srcs{p},'')
        New_List_String_Srcs{i} = List_Strings_Srcs{p};
        New_List_String_Paths{i} = List_Strings_Paths{p};
        i = i+1;
      end
   end
   set(handles.MPSLBImagesSrcs,'value',[]);
   set(handles.MPSLBImagesPaths,'value',[]);
   set(handles.MPSLBImagesSrcs,'string',New_List_String_Srcs);
   set(handles.MPSLBImagesPaths,'string',New_List_String_Paths);
end
% hObject    handle to MPSPBSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBDelete.
function MPSPBDelete_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
List_Strings_Srcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
[k,s] = size(List_Strings_Srcs);
New_List_Strings_Srcs = [];
New_List_Strings_Paths = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          List_Strings_Srcs{Selected_Index(i)} = [];
          set(handles.MPSLBImagesSrcs,'String',List_Strings_Srcs);
          set(handles.MPSLBImagesPaths,'Value',Selected_Index(i));
          List_Strings_Paths=cellstr(get(handles.MPSLBImagesPaths,'string'));
          List_Strings_Paths{Selected_Index(i)} = [];
       end
       i = 1;
       for p = 1 : k
          if ~isequal(List_Strings_Srcs{p},'')
              New_List_Strings_Srcs{i} = List_Strings_Srcs{p};
              New_List_Strings_Paths{i} = List_Strings_Paths{p};
              i = i+1;
          end
       end
       set(handles.MPSLBImagesSrcs,'value',[]);
       set(handles.MPSLBImagesPaths,'value',[]);
       set(handles.MPSLBImagesSrcs,'String',New_List_Strings_Srcs);
       set(handles.MPSLBImagesPaths,'String',New_List_Strings_Paths);
    catch ex
        
    end
% hObject    handle to MPSPBDelete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBShow.
function MPSPBShow_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPSLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       imshow(A,'Parent',handles.MPSAImageSrc);
    catch ex
        
    end
% hObject    handle to MPSPBShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBURL.
function MPSPBURL_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPSLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       set(handles.MPSSTURL,'string',Selected_ItemPaths);
    catch ex
        
    end


% --- Executes on selection change in MPSLBImagesSrcs.
function MPSLBImagesSrcs_Callback(hObject, eventdata, handles)
% hObject    handle to MPSLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSLBImagesSrcs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSLBImagesSrcs


% --- Executes during object creation, after setting all properties.
function MPSLBImagesSrcs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSLBImagesSrcs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBUp.
function MPSPBUp_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPSLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       if ~isequal(Selected_Index,1)
          [n,m] = size(ListStringsSrcs);
          for i=1 : n
              if i+1 == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPSLBImagesSrcs,'value',[Selected_Index-1]);
   set(handles.MPSLBImagesPaths,'value',[Selected_Index-1]);
   set(handles.MPSLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPSLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end
% hObject    handle to MPSPBUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBDown.
function MPSPBDown_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBImagesSrcs,'Value');
ListStringsPaths=cellstr(get(handles.MPSLBImagesPaths,'string'));
ListStringsSrcs=cellstr(get(handles.MPSLBImagesSrcs,'string'));
NewListStringsSrcs = [];
NewListStringsPaths = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPTLBImagesPaths,'Value',Selected_Index);
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       [n,m] = size(ListStringsSrcs);
       if ~isequal(Selected_Index,n)
          for i=1 : n
              if i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
                  NewListStringsPaths{i} = ListStringsPaths{i+1};
              elseif i == Selected_Index+1
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
                  NewListStringsPaths{i} = ListStringsPaths{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
                  NewListStringsPaths{i} = ListStringsPaths{i};
              end
          end
   set(handles.MPSLBImagesSrcs,'value',[Selected_Index+1]);
   set(handles.MPSLBImagesPaths,'value',[Selected_Index+1]);
   set(handles.MPSLBImagesSrcs,'string',NewListStringsSrcs);
   set(handles.MPSLBImagesPaths,'string',NewListStringsPaths);
       end
    catch ex
    
    end
% hObject    handle to MPSPBDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPSPBDeselect.
function MPSPBDeselect_Callback(hObject, eventdata, handles)
       set(handles.MPSLBImagesSrcs,'value',[]);
       set(handles.MPSLBImagesPaths,'value',[]);


% --- Executes on selection change in MPSLBImagesPaths.
function MPSLBImagesPaths_Callback(hObject, eventdata, handles)
% hObject    handle to MPSLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSLBImagesPaths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSLBImagesPaths


% --- Executes during object creation, after setting all properties.
function MPSLBImagesPaths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSLBImagesPaths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBSave.
function MPSPBSave_Callback(hObject, eventdata, handles)
I2 = get(findall(handles.MPSAResult,'type','image'),'cdata');
[filename, pathname, filterindex] = uiputfile( ...
{'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
 'Save as');
if ~isequal(filename,0)
    imwrite(I2,fullfile(pathname,filename));
      List_Strings=cellstr(get(handles.MPSLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPSLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPSLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPSLBImagesPaths,'string',List_Strings);
end
% hObject    handle to MPSPBSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRePBSave.
function MPRePBSave_Callback(hObject, eventdata, handles)
I2 = get(findall(handles.MPReAResult,'type','image'),'cdata');
[filename, pathname, filterindex] = uiputfile( ...
{'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
 'Save as');
if ~isequal(filename,0)
    imwrite(I2,fullfile(pathname,filename));
      List_Strings=cellstr(get(handles.MPReLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPReLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPReLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPReLBImagesPaths,'string',List_Strings);
end


% --- Executes on button press in MPRePBDeselect.
function MPRePBDeselect_Callback(hObject, eventdata, handles)
       set(handles.MPReLBImagesSrcs,'value',[]);
       set(handles.MPReLBImagesPaths,'value',[]);



function MPReEPSNR_Callback(hObject, eventdata, handles)
% hObject    handle to MPReEPSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPReEPSNR as text
%        str2double(get(hObject,'String')) returns contents of MPReEPSNR as a double


% --- Executes on button press in MPRePBIMFC.
function MPRePBIMFC_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPReLBImagesSrcs,'Value');
ListStringsSrcs=cellstr(get(handles.MPReLBImagesSrcs,'string'));
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       set(handles.MPReLBImagesPaths,'Value',Selected_Index);
       ListStringsPaths=cellstr(get(handles.MPReLBImagesPaths,'string'));
       Selected_ItemPaths = ListStringsPaths{Selected_Index};
       A = imread(fullfile(Selected_ItemPaths,Selected_ItemSrcs));
       contents = get(handles.MPRePUMFsS,'String'); 
       Size = contents{get(handles.MPRePUMFsS,'Value')};
       contents = get(handles.MPRePUMFs,'String'); 
       Filter = contents{get(handles.MPRePUMFs,'Value')};
       Sigma = str2double(get(handles.MPReESigma,'String'));
       I = [];
       P = [];
       switch Size 
           case '3*3'
               P = [3 3]
           case '5*5'
               disp(Size);
               P = [5 5];
           case '7*7'
               P = [7 7];
       end
               try
                   H=fspecial(Filter, P,Sigma);
               catch e
                   try
                       H=fspecial(Filter, P);
                   catch x
                       try
                          H=fspecial(Filter, Sigma);
                       catch y
                          try
                              H=fspecial(P, Sigma);
                          catch z
                       
                          end
                       end
                   end
               end
                   r=A(:,:,1); %C1
                   v=A(:,:,2); %C2
                   b=A(:,:,3); %C3
                   r1=imfilter(r,H);
                   v1=imfilter(v,H);
                   b1=imfilter(b,H);
                   kfilt(:,:,1)=r1;
                   kfilt(:,:,2)=v1;
                   kfilt(:,:,3)=b1;
       imshow(kfilt,'Parent',handles.MPReAResult);
    catch ex
        disp(ex);
    end


% --- Executes on button press in MPRhPBDeselect.
function MPRhPBDeselect_Callback(hObject, eventdata, handles)
       set(handles.MPRhLBImagesSrcs,'value',[]);
       set(handles.MPRhLBImagesPaths,'value',[]);


% --- Executes during object deletion, before destroying properties.


% --- Executes during object deletion, before destroying properties.
function MPRhSTResult_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to MPRhSTResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MPRhPBSave.
function MPRhPBSave_Callback(hObject, eventdata, handles)
I2 = get(findall(handles.MPRhAResult,'type','image'),'cdata');
[filename, pathname, filterindex] = uiputfile( ...
{'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
 'Save as');
if ~isequal(filename,0)
    imwrite(I2,fullfile(pathname,filename));
      List_Strings=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPRhLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPRhLBImagesPaths,'string',List_Strings);
end


% --- Executes on button press in MPRhPBHSave.
function MPRhPBHSave_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uiputfile( ...
{'*.jpeg;*.jpg;*.bmp;*.tif;*.png','Image(*.jpeg;*.jpg;*.bmp;*.tif;*.png)'; ...
   '*.*',  'All Files (*.*)'}, ...
 'Save as');
if ~isequal(filename,0)
    try
    rgb = [];
f = getframe(handles.MPRhAImageHist);
[im,map] = frame2im(f); 
if isempty(map)
  rgb = im;
else
  rgb = ind2rgb(im,map);
end

    imwrite(rgb,fullfile(pathname,filename));
      List_Strings=cellstr(get(handles.MPRhLBImagesSrcs,'string'));
      New_Item=filename;
      List_Strings{end+1}=New_Item;
      set(handles.MPTLBImagesSrcs,'string',List_Strings);
      List_Strings=cellstr(get(handles.MPRhLBImagesPaths,'string'));
      New_Item=pathname;
      List_Strings{end+1}=New_Item;
      set(handles.MPRhLBImagesPaths,'string',List_Strings);
          catch ex
        
end
    end

% hObject    handle to MPRhPBHSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in MPSPUMNF.
function MPSPUMNF_Callback(hObject, eventdata, handles)
% hObject    handle to MPSPUMNF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSPUMNF contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSPUMNF


% --- Executes during object creation, after setting all properties.
function MPSPUMNF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSPUMNF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MPSPUMNS.
function MPSPUMNS_Callback(hObject, eventdata, handles)
% hObject    handle to MPSPUMNS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MPSPUMNS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MPSPUMNS


% --- Executes during object creation, after setting all properties.
function MPSPUMNS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSPUMNS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MPSESigma_Callback(hObject, eventdata, handles)
% hObject    handle to MPSESigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPSESigma as text
%        str2double(get(hObject,'String')) returns contents of MPSESigma as a double


% --- Executes during object creation, after setting all properties.
function MPSESigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSESigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBAC.
function MPSPBAC_Callback(hObject, eventdata, handles)
try
      List_Strings=cellstr(get(handles.MPSLBSClass,'string'));
      New_Item=get(handles.MPSEAC,'String');
      List_Strings{end+1}=New_Item;
      set(handles.MPSLBSClass,'string',List_Strings);
      
   New_List_String_Srcs = [];
   List_Strings_Srcs = cellstr(get(handles.MPSLBSClass,'string'));
   [k,s] = size(List_Strings_Srcs);
   i = 1;
   for p = 1 : k
      if ~isequal(List_Strings_Srcs{p},'')
        New_List_String_Srcs{i} = List_Strings_Srcs{p};
        i = i+1;
      end
   end
   set(handles.MPSLBSClass,'value',[]);
   set(handles.MPSLBSClass,'string',New_List_String_Srcs);
catch ex
    
end



function MPSEAC_Callback(hObject, eventdata, handles)
% hObject    handle to MPSEAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MPSEAC as text
%        str2double(get(hObject,'String')) returns contents of MPSEAC as a double


% --- Executes during object creation, after setting all properties.
function MPSEAC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MPSEAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MPSPBDC.
function MPSPBDC_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBSClass,'Value');
List_Strings_Srcs=cellstr(get(handles.MPSLBSClass,'string'));
[k,s] = size(List_Strings_Srcs);
New_List_Strings_Srcs = [];
    try
       [n,m] = size(Selected_Index);
       for i=1 : m
          List_Strings_Srcs{Selected_Index(i)} = [];
          set(handles.MPSLBSClass,'String',List_Strings_Srcs);
       end
       i = 1;
       for p = 1 : k
          if ~isequal(List_Strings_Srcs{p},'')
              New_List_Strings_Srcs{i} = List_Strings_Srcs{p};
              i = i+1;
          end
       end
       set(handles.MPSLBSClass,'value',[]);
       set(handles.MPSLBSClass,'String',New_List_Strings_Srcs);
    catch ex
        
    end


% --- Executes on button press in MPSPBCUp.
function MPSPBCUp_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBSClass,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBSClass,'string'));
NewListStringsSrcs = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       if ~isequal(Selected_Index,1)
          [n,m] = size(ListStringsSrcs);
          for i=1 : n
              if i+1 == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
              elseif i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
              end
          end
   set(handles.MPSLBSClass,'value',[Selected_Index-1]);
   set(handles.MPSLBSClass,'string',NewListStringsSrcs);
       end
    catch ex
    
    end


% --- Executes on button press in MPPBCDown.
function MPPBCDown_Callback(hObject, eventdata, handles)
Selected_Index = get(handles.MPSLBSClass,'Value');
ListStringsSrcs=cellstr(get(handles.MPSLBSClass,'string'));
NewListStringsSrcs = [];
    try
       Selected_ItemSrcs = ListStringsSrcs{Selected_Index};
       [n,m] = size(ListStringsSrcs);
       if ~isequal(Selected_Index,n)
          for i=1 : n
              if i == Selected_Index
                  NewListStringsSrcs{i} = ListStringsSrcs{i+1};
              elseif i == Selected_Index+1
                  NewListStringsSrcs{i} = ListStringsSrcs{i-1};
              else
                  NewListStringsSrcs{i} = ListStringsSrcs{i};
              end
          end
   set(handles.MPSLBSClass,'value',[Selected_Index+1]);
   set(handles.MPSLBSClass,'string',NewListStringsSrcs);
       end
    catch ex
    
    end
