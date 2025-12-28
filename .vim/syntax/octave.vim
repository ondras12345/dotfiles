" https://www.vim.org/scripts/script.php?script_id=3600
" Vim syntax file
" Language:    Octave
" Maintainer:  Rik <rik@octave.org>
" Last Change: 26 Mar 2023
" Syntax matched to Octave Release: 8.1.0
" Underscores now supported in numbers for readability (e.g., 1_000).
" Class signifiers (u8,u16,u32,u64,s8,s16,s32,s64) for binary and hex numbers.
" Fortran exponeniation operator ("**") is now an error.
" Backslash line continuations in single-quoted strings are now an error.
" Backslash line continuations for ordinary code are now an error.
" Trailing text on the first line of a block comment is now an error.
" Support for Vim < 5.7 has been removed.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Use case sensitive matching of keywords
syn case match

" Set iskeyword to guarantee portability
syntax iskeyword @,48-57,_,192-255

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax group definitions for Octave

" List of Octave keywords
syn keyword octaveBeginKeyword  if switch for parfor while do function classdef
syn keyword octaveBeginKeyword  try unwind_protect 

syn keyword octaveElseKeyword   else elseif catch unwind_protect_cleanup

syn keyword octaveEndKeyword    end endif endswitch endfor endparfor endwhile
syn keyword octaveEndKeyword    until endfunction endclassdef end_try_catch
syn keyword octaveEndKeyword    end_unwind_protect 
syn keyword octaveEndKeyword    endenumeration endevents endmethods
syn keyword octaveEndKeyword    endproperties

syn keyword octaveLabel         case otherwise

syn keyword octaveStatement     break continue global persistent return

syn keyword octaveVarKeyword    varargin varargout

syn keyword octaveReserved      __FILE__ __LINE__

" Use 'match', rather than 'keyword', because highlighting color depends on
" context and Vim 'keyword' cannot be overriden.
syn match octaveOOKeyword  "^\s*\%(enumeration\|events\|methods\|properties\)\>"

" List of commands (these don't require a parenthesis to invoke)
syn keyword octaveCommand contained  cd chdir clear clearvars close dbcont
syn keyword octaveCommand contained  dbquit dbstep demo diary doc echo edit
syn keyword octaveCommand contained  edit_history example format help history
syn keyword octaveCommand contained  hold ishold load lookfor ls mkoctfile
syn keyword octaveCommand contained  more pkg run run_history save shg test
syn keyword octaveCommand contained  type what which who whos 

" List of functions which can be called in some other manner:
" As a command OR as a read-only access of internal variables OR as functions.

" List of functions also used as commands
syn keyword octaveSetFcn contained  cd chdir clear clearvars close dbcont
syn keyword octaveSetFcn contained  dbquit dbstep demo diary doc echo edit
syn keyword octaveSetFcn contained  edit_history example format help history
syn keyword octaveSetFcn contained  hold ishold load lookfor ls mkoctfile
syn keyword octaveSetFcn contained  more pkg run run_history save shg test
syn keyword octaveSetFcn contained  type what which who whos 
" List of functions which initialize internal variables
syn keyword octaveSetFcn contained  EDITOR EXEC_PATH I IMAGE_PATH Inf J NA
syn keyword octaveSetFcn contained  NaN PAGER PAGER_FLAGS PS1 PS2 PS4 ans
syn keyword octaveSetFcn contained  auto_repeat_debug_command beep_on_error
syn keyword octaveSetFcn contained  built_in_docstrings_file
syn keyword octaveSetFcn contained  completion_append_char
syn keyword octaveSetFcn contained  confirm_recursive_rmdir
syn keyword octaveSetFcn contained  crash_dumps_octave_core debug_java
syn keyword octaveSetFcn contained  debug_on_error
syn keyword octaveSetFcn contained  debug_on_interrupt debug_on_warning
syn keyword octaveSetFcn contained  doc_cache_file e eps false
syn keyword octaveSetFcn contained  fixed_point_format gnuplot_binary
syn keyword octaveSetFcn contained  graphics_toolkit history history_control
syn keyword octaveSetFcn contained  history_file history_save history_size
syn keyword octaveSetFcn contained  history_timestamp_format_string i
syn keyword octaveSetFcn contained  ignore_function_time_stamp inf info_file
syn keyword octaveSetFcn contained  info_program j java_matrix_autoconversion
syn keyword octaveSetFcn contained  java_unsigned_autoconversion
syn keyword octaveSetFcn contained  ls_command
syn keyword octaveSetFcn contained  makeinfo_program max_recursion_depth
syn keyword octaveSetFcn contained  max_stack_depth missing_component_hook
syn keyword octaveSetFcn contained  missing_function_hook nan nargin nargout
syn keyword octaveSetFcn contained  octave_core_file_limit
syn keyword octaveSetFcn contained  octave_core_file_name
syn keyword octaveSetFcn contained  octave_core_file_options
syn keyword octaveSetFcn contained  optimize_subsasgn_calls
syn keyword octaveSetFcn contained  output_precision
syn keyword octaveSetFcn contained  page_output_immediately
syn keyword octaveSetFcn contained  page_screen_output path pi prefdir
syn keyword octaveSetFcn contained  print_empty_dimensions
syn keyword octaveSetFcn contained  print_struct_array_contents realmax
syn keyword octaveSetFcn contained  realmin save_default_options
syn keyword octaveSetFcn contained  save_header_format_string save_precision
syn keyword octaveSetFcn contained  sighup_dumps_octave_core
syn keyword octaveSetFcn contained  sigquit_dumps_octave_core
syn keyword octaveSetFcn contained  sigterm_dumps_octave_core
syn keyword octaveSetFcn contained  silent_functions sparse_auto_mutate
syn keyword octaveSetFcn contained  split_long_rows string_fill_char
syn keyword octaveSetFcn contained  struct_levels_to_print
syn keyword octaveSetFcn contained  suppress_verbose_help_message svd_driver
syn keyword octaveSetFcn contained  texi_macros_file true whos_line_format

" List of functions which get internal variables
syn keyword octaveGetFcn contained  EDITOR EXEC_PATH I IMAGE_PATH Inf J NA
syn keyword octaveGetFcn contained  NaN PAGER PAGER_FLAGS PS1 PS2 PS4 ans
syn keyword octaveGetFcn contained  auto_repeat_debug_command beep_on_error
syn keyword octaveGetFcn contained  built_in_docstrings_file
syn keyword octaveGetFcn contained  completion_append_char
syn keyword octaveGetFcn contained  confirm_recursive_rmdir
syn keyword octaveGetFcn contained  crash_dumps_octave_core debug_java
syn keyword octaveGetFcn contained  debug_jit debug_on_error
syn keyword octaveGetFcn contained  debug_on_interrupt debug_on_warning
syn keyword octaveGetFcn contained  disable_diagonal_matrix
syn keyword octaveGetFcn contained  disable_permutation_matrix disable_range
syn keyword octaveGetFcn contained  doc_cache_file e eps false
syn keyword octaveGetFcn contained  fixed_point_format gnuplot_binary
syn keyword octaveGetFcn contained  graphics_toolkit history history_control
syn keyword octaveGetFcn contained  history_file history_save history_size
syn keyword octaveGetFcn contained  history_timestamp_format_string i
syn keyword octaveGetFcn contained  ignore_function_time_stamp inf info_file
syn keyword octaveGetFcn contained  info_program j java_matrix_autoconversion
syn keyword octaveGetFcn contained  java_unsigned_autoconversion jit_enable
syn keyword octaveGetFcn contained  jit_failcnt jit_startcnt ls_command
syn keyword octaveGetFcn contained  makeinfo_program max_recursion_depth
syn keyword octaveGetFcn contained  max_stack_depth missing_component_hook
syn keyword octaveGetFcn contained  missing_function_hook nan nargin nargout
syn keyword octaveGetFcn contained  octave_core_file_limit
syn keyword octaveGetFcn contained  octave_core_file_name
syn keyword octaveGetFcn contained  octave_core_file_options
syn keyword octaveGetFcn contained  optimize_subsasgn_calls
syn keyword octaveGetFcn contained  output_max_field_width output_precision
syn keyword octaveGetFcn contained  page_output_immediately
syn keyword octaveGetFcn contained  page_screen_output path pi prefdir
syn keyword octaveGetFcn contained  print_empty_dimensions
syn keyword octaveGetFcn contained  print_struct_array_contents realmax
syn keyword octaveGetFcn contained  realmin save_default_options
syn keyword octaveGetFcn contained  save_header_format_string save_precision
syn keyword octaveGetFcn contained  sighup_dumps_octave_core
syn keyword octaveGetFcn contained  sigquit_dumps_octave_core
syn keyword octaveGetFcn contained  sigterm_dumps_octave_core
syn keyword octaveGetFcn contained  silent_functions sparse_auto_mutate
syn keyword octaveGetFcn contained  split_long_rows string_fill_char
syn keyword octaveGetFcn contained  struct_levels_to_print
syn keyword octaveGetFcn contained  suppress_verbose_help_message svd_driver
syn keyword octaveGetFcn contained  texi_macros_file true whos_line_format

" List of Read-Only variables
syn keyword octaveROFcn  F_DUPFD F_GETFD F_GETFL F_SETFD F_SETFL
syn keyword octaveROFcn  OCTAVE_EXEC_HOME OCTAVE_HOME OCTAVE_VERSION O_APPEND
syn keyword octaveROFcn  O_ASYNC O_CREAT O_EXCL O_NONBLOCK O_RDONLY O_RDWR
syn keyword octaveROFcn  O_SYNC O_TRUNC O_WRONLY P_tmpdir SEEK_CUR SEEK_END
syn keyword octaveROFcn  SEEK_SET SIG WCONTINUE WCOREDUMP WEXITSTATUS
syn keyword octaveROFcn  WIFCONTINUED WIFEXITED WIFSIGNALED WIFSTOPPED WNOHANG
syn keyword octaveROFcn  WSTOPSIG WTERMSIG WUNTRACED argv
syn keyword octaveROFcn  available_graphics_toolkits command_line_path groot
syn keyword octaveROFcn  have_window_system isieee isstudent
syn keyword octaveROFcn  loaded_graphics_toolkits matlabroot namelengthmax
syn keyword octaveROFcn  native_float_format pathsep program_invocation_name
syn keyword octaveROFcn  program_name pwd sizemax stderr stdin stdout tempdir 

" List of ordinary functions not in one of the other categories
syn keyword octaveFunction contained  S_ISBLK S_ISCHR S_ISDIR S_ISFIFO S_ISLNK
syn keyword octaveFunction contained  S_ISREG S_ISSOCK abs accumarray accumdim
syn keyword octaveFunction contained  acos acosd acosh acot acotd acoth acsc
syn keyword octaveFunction contained  acscd acsch add_input_event_hook
syn keyword octaveFunction contained  addlistener addpath addpref addproperty
syn keyword octaveFunction contained  addtodate airy all allchild amd ancestor
syn keyword octaveFunction contained  and angle annotation any arch_fit arch_rnd
syn keyword octaveFunction contained  arch_test area arg arma_rnd arrayfun
syn keyword octaveFunction contained  asctime asec asecd asech asin asind asinh
syn keyword octaveFunction contained  assert assignin atan atan2 atan2d atand
syn keyword octaveFunction contained  atanh atexit audiodevinfo audioformats
syn keyword octaveFunction contained  audioinfo audioread audiowrite autoload
syn keyword octaveFunction contained  autoreg_matrix autumn axes axis balance
syn keyword octaveFunction contained  bandwidth bar barh bartlett base2dec
syn keyword octaveFunction contained  base64_decode base64_encode beep bessel
syn keyword octaveFunction contained  besselh besseli besselj besselk bessely
syn keyword octaveFunction contained  beta betainc betaincinv betaln bicg
syn keyword octaveFunction contained  bicgstab bin2dec bincoeff bitand bitcmp
syn keyword octaveFunction contained  bitget bitor bitpack bitset bitshift
syn keyword octaveFunction contained  bitunpack bitxor blackman blanks blkdiag
syn keyword octaveFunction contained  blkmm bone bounds box brighten bsxfun
syn keyword octaveFunction contained  bug_report builtin bunzip2 bzip2 calendar
syn keyword octaveFunction contained  camlight camlookat camorbit campos camroll
syn keyword octaveFunction contained  camtarget camup camva camzoom
syn keyword octaveFunction contained  canonicalize_file_name cart2pol cart2sph
syn keyword octaveFunction contained  cast cat caxis cbrt ccolamd ceil cell
syn keyword octaveFunction contained  cell2mat cell2struct celldisp cellfun
syn keyword octaveFunction contained  cellindexmat cellslices cellstr center cgs
syn keyword octaveFunction contained  char chol chol2inv choldelete cholinsert
syn keyword octaveFunction contained  cholinv cholshift cholupdate circshift
syn keyword octaveFunction contained  citation cla clabel class clc
syn keyword octaveFunction contained  clearAllMemoizedCaches clf clock closereq
syn keyword octaveFunction contained  cmdline_options cmpermute cmunique colamd
syn keyword octaveFunction contained  colloc colon colorbar colorcube colormap
syn keyword octaveFunction contained  colperm colstyle columns comet comet3
syn keyword octaveFunction contained  commandhistory commandwindow common_size
syn keyword octaveFunction contained  commutation_matrix compan compare_versions
syn keyword octaveFunction contained  compass completion_matches complex
syn keyword octaveFunction contained  computer cond condeig condest conj contour
syn keyword octaveFunction contained  contour3 contourc contourf contrast conv
syn keyword octaveFunction contained  conv2 convhull convhulln convn cool copper
syn keyword octaveFunction contained  copyfile copyobj corr corrcoef cos cosd
syn keyword octaveFunction contained  cosh cosint cospi cot cotd coth cov
syn keyword octaveFunction contained  cplxpair cputime cross csc cscd csch
syn keyword octaveFunction contained  cstrcat csvread csvwrite csymamd ctime
syn keyword octaveFunction contained  ctranspose cubehelix cummax cummin cumprod
syn keyword octaveFunction contained  cumsum cumtrapz curl cylinder daspect
syn keyword octaveFunction contained  daspk daspk_options dasrt dasrt_options
syn keyword octaveFunction contained  dassl dassl_options date datenum datestr
syn keyword octaveFunction contained  datetick datevec dawson dbclear dbdown
syn keyword octaveFunction contained  dblist dblquad dbnext dbstack dbstatus
syn keyword octaveFunction contained  dbstop dbtype dbup dbwhere deal deblank
syn keyword octaveFunction contained  dec2base dec2bin dec2hex decic deconv
syn keyword octaveFunction contained  deg2rad del2 delaunay delaunayn delete
syn keyword octaveFunction contained  dellistener desktop det detrend diag
syn keyword octaveFunction contained  dialog diff diffpara diffuse dir
syn keyword octaveFunction contained  dir_encoding dir_in_loadpath discrete_cdf
syn keyword octaveFunction contained  discrete_inv discrete_pdf discrete_rnd
syn keyword octaveFunction contained  disp display divergence dlmread dlmwrite
syn keyword octaveFunction contained  dmperm do_string_escapes doc_cache_create
syn keyword octaveFunction contained  dos dot double drawnow dsearch dsearchn
syn keyword octaveFunction contained  dup2 duplication_matrix durbinlevinson eig
syn keyword octaveFunction contained  eigs ellipj ellipke ellipsoid
syn keyword octaveFunction contained  empirical_cdf empirical_inv empirical_pdf
syn keyword octaveFunction contained  empirical_rnd endgrent endpwent endsWith
syn keyword octaveFunction contained  eomday eq erase erf erfc erfcinv erfcx
syn keyword octaveFunction contained  erfi erfinv errno errno_list error
syn keyword octaveFunction contained  error_ids errorbar errordlg etime etree
syn keyword octaveFunction contained  etreeplot eval evalc evalin exec exist
syn keyword octaveFunction contained  exit exp expint expm expm1 eye ezcontour
syn keyword octaveFunction contained  ezcontourf ezmesh ezmeshc ezplot ezplot3
syn keyword octaveFunction contained  ezpolar ezsurf ezsurfc factor factorial
syn keyword octaveFunction contained  fail fclear fclose fcntl fdisp feather
syn keyword octaveFunction contained  feof ferror feval fflush fft fft2 fftconv
syn keyword octaveFunction contained  fftfilt fftn fftshift fftw fgetl fgets
syn keyword octaveFunction contained  fieldnames figure file_in_loadpath
syn keyword octaveFunction contained  file_in_path fileattrib filebrowser
syn keyword octaveFunction contained  fileparts fileread filesep fill fill3
syn keyword octaveFunction contained  filter filter2 find findall findfigs
syn keyword octaveFunction contained  findobj findstr fix flag flintmax flip
syn keyword octaveFunction contained  flipdim fliplr flipud floor fminbnd
syn keyword octaveFunction contained  fminsearch fminunc fopen fork fplot
syn keyword octaveFunction contained  fprintf fputs fractdiff frame2im fread
syn keyword octaveFunction contained  freport freqz freqz_plot frewind fscanf
syn keyword octaveFunction contained  fseek fskipl fsolve ftell full fullfile
syn keyword octaveFunction contained  func2str functions fwrite fzero gallery
syn keyword octaveFunction contained  gamma gammainc gammaincinv gammaln gca
syn keyword octaveFunction contained  gcbf gcbo gcd gcf gco ge genpath
syn keyword octaveFunction contained  genvarname get get_first_help_sentence
syn keyword octaveFunction contained  get_help_text get_help_text_from_file
syn keyword octaveFunction contained  get_home_directory getappdata getegid
syn keyword octaveFunction contained  getenv geteuid getfield getframe getgid
syn keyword octaveFunction contained  getgrent getgrgid getgrnam gethostname
syn keyword octaveFunction contained  getpgrp getpid getpixelposition getppid
syn keyword octaveFunction contained  getpref getpwent getpwnam getpwuid
syn keyword octaveFunction contained  getrusage getuid ginput givens glob glpk
syn keyword octaveFunction contained  gls gmres gmtime gplot grabcode gradient
syn keyword octaveFunction contained  gray gray2ind grid griddata griddata3
syn keyword octaveFunction contained  griddatan gsvd gt gtext gui_mainfcn
syn keyword octaveFunction contained  guidata guihandles gunzip gzip hadamard
syn keyword octaveFunction contained  hamming hankel hanning hash hdl2struct
syn keyword octaveFunction contained  helpdlg hess hex2dec hex2num hggroup
syn keyword octaveFunction contained  hgload hgsave hgtransform hidden hilb hist
syn keyword octaveFunction contained  histc home horzcat hot housh hsv hsv2rgb
syn keyword octaveFunction contained  humps hurst hypot ichol idivide ifelse
syn keyword octaveFunction contained  ifft ifft2 ifftn ifftshift ilu im2double
syn keyword octaveFunction contained  im2frame imag image imagesc imfinfo
syn keyword octaveFunction contained  imformats import importdata imread imshow
syn keyword octaveFunction contained  imwrite ind2gray ind2rgb ind2sub index
syn keyword octaveFunction contained  inferiorto info inpolygon input
syn keyword octaveFunction contained  inputParser inputdlg inputname int16
syn keyword octaveFunction contained  int2str int32 int64 int8 integral
syn keyword octaveFunction contained  integral2 integral3 interp1 interp2
syn keyword octaveFunction contained  interp3 interpft interpn intersect intmax
syn keyword octaveFunction contained  intmin inv inverse invhilb ipermute iqr
syn keyword octaveFunction contained  is_absolute_filename is_dq_string
syn keyword octaveFunction contained  is_function_handle is_leap_year
syn keyword octaveFunction contained  is_rooted_relative_filename is_same_file
syn keyword octaveFunction contained  is_sq_string is_valid_file_id isa isalnum
syn keyword octaveFunction contained  isalpha isappdata isargout isascii isaxes
syn keyword octaveFunction contained  isbanded isbool iscell iscellstr ischar
syn keyword octaveFunction contained  iscntrl iscolormap iscolumn iscomplex
syn keyword octaveFunction contained  isdebugmode isdefinite isdeployed isdiag
syn keyword octaveFunction contained  isdigit isdir isempty isequal isequaln
syn keyword octaveFunction contained  isequalwithequalnans isfield isfigure
syn keyword octaveFunction contained  isfile isfinite isfloat isfolder isglobal
syn keyword octaveFunction contained  isgraph isgraphics isguirunning ishandle
syn keyword octaveFunction contained  ishermitian ishghandle isindex isinf
syn keyword octaveFunction contained  isinteger isjava iskeyword isletter
syn keyword octaveFunction contained  islogical islower ismac ismatrix ismember
syn keyword octaveFunction contained  ismethod isna isnan isnull isnumeric
syn keyword octaveFunction contained  isobject isocaps isocolors isonormals
syn keyword octaveFunction contained  isosurface ispc ispref isprime isprint
syn keyword octaveFunction contained  isprop ispunct isreal isrow isscalar
syn keyword octaveFunction contained  issorted isspace issparse issquare isstr
syn keyword octaveFunction contained  isstring isstrprop isstruct issymmetric
syn keyword octaveFunction contained  istril istriu isunix isupper isvarname
syn keyword octaveFunction contained  isvector isxdigit javaArray javaMethod
syn keyword octaveFunction contained  javaObject java_get java_set javaaddpath
syn keyword octaveFunction contained  javachk javaclasspath javamem javarmpath
syn keyword octaveFunction contained  jet jsondecode jsonencode
syn keyword octaveFunction contained  jupyter_notebookkbhit kendall keyboard
syn keyword octaveFunction contained  kill kron krylov kurtosis lasterr
syn keyword octaveFunction contained  lasterror lastwarn lcm ldivide le legend
syn keyword octaveFunction contained  legendre length lgamma license light
syn keyword octaveFunction contained  lightangle lighting lin2mu line lines link
syn keyword octaveFunction contained  linkaxes linkprop linsolve linspace
syn keyword octaveFunction contained  list_in_columns list_primes listdlg
syn keyword octaveFunction contained  listfonts loadobj localfunctions localtime
syn keyword octaveFunction contained  log log10 log1p log2 logical loglog
syn keyword octaveFunction contained  loglogerr logm logspace lookup lower lscov
syn keyword octaveFunction contained  lsode lsode_options lsqnonneg lstat lt lu
syn keyword octaveFunction contained  luupdate mad magic make_absolute_filename
syn keyword octaveFunction contained  mat2cell mat2str material matrix_type max
syn keyword octaveFunction contained  maxNumCompThreads mean meansq median
syn keyword octaveFunction contained  memoize memory menu merge mesh meshc
syn keyword octaveFunction contained  meshgrid meshz metaclass mex mexext
syn keyword octaveFunction contained  mfilename mgorth min minus mislocked mkdir
syn keyword octaveFunction contained  mkfifo mkpp mkstemp mktime mldivide mlock
syn keyword octaveFunction contained  mod mode moment movefile movegui movfun
syn keyword octaveFunction contained  movie movmad movmax movmean movmedian
syn keyword octaveFunction contained  movmin movprod movslice movstd movsum
syn keyword octaveFunction contained  movvar mpoles mpower mrdivide msgbox
syn keyword octaveFunction contained  mtimes mu2lin munlock mustBeFinite
syn keyword octaveFunction contained  mustBeGreaterThan mustBeGreaterThanOrEqual
syn keyword octaveFunction contained  mustBeInteger mustBeLessThan
syn keyword octaveFunction contained  mustBeLessThanOrEqual mustBeMember
syn keyword octaveFunction contained  mustBeNegative mustBeNonNan mustBeNonempty
syn keyword octaveFunction contained  mustBeNonnegative mustBeNonpositive
syn keyword octaveFunction contained  mustBeNonsparse mustBeNonzero
syn keyword octaveFunction contained  mustBeNumeric mustBeNumericOrLogical
syn keyword octaveFunction contained  mustBePositive mustBeReal namedargs2cell
syn keyword octaveFunction contained  nargchk narginchk nargoutchk
syn keyword octaveFunction contained  native2unicode nchoosek ndgrid ndims ne
syn keyword octaveFunction contained  newline newplot news nextpow2 nnz nonzeros
syn keyword octaveFunction contained  norm normalize normest normest1 not now
syn keyword octaveFunction contained  nproc nth_element nthargout nthroot null
syn keyword octaveFunction contained  num2cell num2hex num2str numel numfields
syn keyword octaveFunction contained  nzmax ocean ode15i ode15s ode23 ode23s
syn keyword octaveFunction contained  ode45 odeget odeplot odeset ols onCleanup
syn keyword octaveFunction contained  ones open openfig openvar optimget
syn keyword octaveFunction contained  optimize_diagonal_matrix
syn keyword octaveFunction contained  optimize_permutation_matrix optimize_range
syn keyword octaveFunction contained  optimset or ordeig orderfields ordqz
syn keyword octaveFunction contained  ordschur orient orth oruntests ostreamtube
syn keyword octaveFunction contained  ostrsplit pack padecoef pagectranspose
syn keyword octaveFunction contained  pagetranspose pan pareto parseparams
syn keyword octaveFunction contained  pascal patch pathdef pause pbaspect pcg
syn keyword octaveFunction contained  pchip pclose pcolor pcr peaks periodogram
syn keyword octaveFunction contained  perl perms permute pie pie3 pink pinv pipe
syn keyword octaveFunction contained  planerot plot plot3 plotmatrix plotyy plus
syn keyword octaveFunction contained  pol2cart polar poly polyaffine polyarea
syn keyword octaveFunction contained  polyder polyeig polyfit polygcd polyint
syn keyword octaveFunction contained  polyout polyreduce polyval polyvalm popen
syn keyword octaveFunction contained  popen2 postpad pow2 power powerset ppder
syn keyword octaveFunction contained  ppint ppjumps ppval pqpnonneg prctile
syn keyword octaveFunction contained  preferences prepad primes print
syn keyword octaveFunction contained  print_usage printd printf prism prod
syn keyword octaveFunction contained  profexplore profexport profile profshow
syn keyword octaveFunction contained  psi publish putenv puts python qmr qp qr
syn keyword octaveFunction contained  qrdelete qrinsert qrshift qrupdate quad
syn keyword octaveFunction contained  quad2d quad_options quadcc quadgk quadl
syn keyword octaveFunction contained  quadv quantile questdlg quit quiver
syn keyword octaveFunction contained  quiver3 qz qzhess rad2deg rainbow rand
syn keyword octaveFunction contained  rande randg randi randn randp randperm
syn keyword octaveFunction contained  range rank ranks rat rats rcond rdivide
syn keyword octaveFunction contained  readdir readline_re_read_init_file
syn keyword octaveFunction contained  readline_read_init_file readlink real
syn keyword octaveFunction contained  reallog realpow realsqrt record rectangle
syn keyword octaveFunction contained  rectint recycle reducepatch reducevolume
syn keyword octaveFunction contained  refresh refreshdata regexp regexpi
syn keyword octaveFunction contained  regexprep regexptranslate
syn keyword octaveFunction contained  register_graphics_toolkit rehash rem
syn keyword octaveFunction contained  remove_input_event_hook rename repelem
syn keyword octaveFunction contained  repelems repmat rescale reset reshape
syn keyword octaveFunction contained  residue resize restoredefaultpath rethrow
syn keyword octaveFunction contained  rgb2gray rgb2hsv rgb2ind rgbplot ribbon
syn keyword octaveFunction contained  rindex rmappdata rmdir rmfield rmpath
syn keyword octaveFunction contained  rmpref rng roots rose rosser rot90 rotate
syn keyword octaveFunction contained  rotate3d rotdim rotx roty rotz round
syn keyword octaveFunction contained  roundb rows rref rsf2csf rticks run_count
syn keyword octaveFunction contained  rundemos runlength saveas savefig saveobj
syn keyword octaveFunction contained  savepath scanf scatter scatter3 schur sec
syn keyword octaveFunction contained  secd sech semilogx semilogxerr semilogy
syn keyword octaveFunction contained  semilogyerr set setappdata setdiff setenv
syn keyword octaveFunction contained  setfield setgrent setpref setpwent setstr
syn keyword octaveFunction contained  setxor shading shift shiftdim shrinkfaces
syn keyword octaveFunction contained  sign signbit sin sinc sind sinetone
syn keyword octaveFunction contained  sinewave single sinh sinint sinpi size
syn keyword octaveFunction contained  size_equal sizeof skewness slice smooth3
syn keyword octaveFunction contained  sombrero sort sortrows sound soundsc
syn keyword octaveFunction contained  source spalloc sparse spaugment spconvert
syn keyword octaveFunction contained  spdiags spearman spectral_adf spectral_xdf
syn keyword octaveFunction contained  specular speed spencer speye spfun
syn keyword octaveFunction contained  sph2cart sphere spinmap spline splinefit
syn keyword octaveFunction contained  spones spparms sprand sprandn sprandsym
syn keyword octaveFunction contained  sprank spring sprintf spstats spy sqp sqrt
syn keyword octaveFunction contained  sqrtm squeeze sscanf stairs startsWith
syn keyword octaveFunction contained  stat statistics std stem stem3 stemleaf
syn keyword octaveFunction contained  stft str2double str2func str2num strcat
syn keyword octaveFunction contained  strchr strcmp strcmpi stream2 stream3
syn keyword octaveFunction contained  streamline streamribbon streamtube strfind
syn keyword octaveFunction contained  strftime strjoin strjust strmatch strncmp
syn keyword octaveFunction contained  strncmpi strptime strread strrep strsplit
syn keyword octaveFunction contained  strtok strtrim strtrunc struct struct2cell
syn keyword octaveFunction contained  struct2hdl structfun strvcat sub2ind
syn keyword octaveFunction contained  subplot subsasgn subsindex subspace
syn keyword octaveFunction contained  subsref substr substruct sum summer sumsq
syn keyword octaveFunction contained  superiorto surf surface surfc surfl
syn keyword octaveFunction contained  surfnorm svd svds swapbytes sylvester
syn keyword octaveFunction contained  symamd symbfact symlink symrcm symvar
syn keyword octaveFunction contained  synthesis system tan tand tanh tar
syn keyword octaveFunction contained  tempname terminal_size tetramesh text
syn keyword octaveFunction contained  textread textscan tfqmr thetaticks tic
syn keyword octaveFunction contained  tilde_expand time times title tmpfile toc
syn keyword octaveFunction contained  toeplitz tolower toupper trace transpose
syn keyword octaveFunction contained  trapz treelayout treeplot tril trimesh
syn keyword octaveFunction contained  triplequad triplot trisurf triu tsearch
syn keyword octaveFunction contained  tsearchn turbo typecast typeinfo
syn keyword octaveFunction contained  uibuttongroup uicontextmenu uicontrol
syn keyword octaveFunction contained  uifigure uigetdir uigetfile uimenu uint16
syn keyword octaveFunction contained  uint32 uint64 uint8 uipanel uipushtool
syn keyword octaveFunction contained  uiputfile uiresume uisetfont uitable
syn keyword octaveFunction contained  uitoggletool uitoolbar uiwait umask uminus
syn keyword octaveFunction contained  uname undo_string_escapes unicode2native
syn keyword octaveFunction contained  unicode_idx union unique uniquetol unix
syn keyword octaveFunction contained  unlink unmkpp unpack unsetenv untabify
syn keyword octaveFunction contained  untar unwrap unzip uplus upper urlread
syn keyword octaveFunction contained  urlwrite usejava user_config_dir
syn keyword octaveFunction contained  user_data_dir validateattributes
syn keyword octaveFunction contained  validatestring vander var vec vech vecnorm
syn keyword octaveFunction contained  vectorize ver verLessThan version vertcat
syn keyword octaveFunction contained  view viridis voronoi voronoin waitbar
syn keyword octaveFunction contained  waitfor waitforbuttonpress waitpid warndlg
syn keyword octaveFunction contained  warning warning_ids warranty waterfall web
syn keyword octaveFunction contained  weboptions webread webwrite weekday white
syn keyword octaveFunction contained  whitebg wilkinson winqueryreg winter
syn keyword octaveFunction contained  workspace xlabel xlim xor xtickangle
syn keyword octaveFunction contained  xticklabels xticks yes_or_no ylabel ylim
syn keyword octaveFunction contained  ytickangle yticklabels yticks yulewalker
syn keyword octaveFunction contained  zeros zip zlabel zlim zoom zscore
syn keyword octaveFunction contained  ztickangle zticklabels zticks

" classdef keywords that may also be used as functions
syn keyword octaveFunction contained  enumeration events methods properties 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add functions defined in .m file being read to list of highlighted functions
function! s:CheckForFunctions()
  let i = 1
  while i <= line('$')
    let line = getline(i)
    " Only look for functions at start of line.
    " Commented function, '# function', will not trigger as match returns 3
    if match(line, '\Cfunction') == 0
      let line = substitute(line, '\vfunction *([^(]*\= *)?', '', '')
      let nfun = matchstr(line, '^\h\w*')
      if !empty(nfun)
        execute "syn keyword octaveFunction" nfun
      endif
    " Include anonymous functions 'func = @(...)'.
    elseif match(line, '\<\%(\h\w*\)\s*=\s*@\s*(') != -1
      let list = matchlist(line, '\<\(\h\w*\)\s*=\s*@\s*(')
      let nfun = list[1]
      if !empty(nfun)
        " Use contained keyword to prevent highlighting on LHS of '='
        execute "syn keyword octaveFunction contained" nfun
      endif
    endif
    let i = i + 1
  endwhile
endfunction

call s:CheckForFunctions()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Variables.  (Appears early as a rule so it can be overridden)
syn match octaveUserVar  "\<\h\k*\>"

" Define clusters for ease of writing subsequent rules
syn cluster AllGetWords contains=octaveUserVar,octaveCommand,octaveGetFcn,octaveFunction
syn cluster AllSetWords contains=octaveUserVar,octaveCommand,octaveSetFcn,octaveFunction

" Switch highlighting of variables based on coding use
" Get -> Constant or Statement highlighting, Set -> Function highlighting
" order of items is is important here
syn match octaveSetUse  "\<\h\k*\>\s*("me=e-1  contains=@AllSetWords
syn match octaveGetUse  "\<\h\k*\>\%(\s*\)\@>\ze\%([^(]\|(\s*)\|$\)"  contains=@AllGetWords

" Don't highlight Octave keywords on LHS of '=', these are user variables
syn match octaveUserVar  "\<\h\k*\>\ze\s*\%(([^)]\+)\)\?\s*==\@!"
" Special characters i,j,I,J on LHS of relational operator are user variables
syn match octaveUserVar  "\<[ijIJ]\ze\s*[<>!~=]=\?"

" Extend highlight across entire structs
syn match octaveStruct  "\<\h\k*\.\h\%(\k\|\.\)*\>"

" Struct with invalid identifier starting with number (Example: 1ab. or a.1b)
syn region octaveError  start="\<\d\+\ze\h\+\."  end=""  oneline
syn region octaveError  start="\<\h\%(\k\|\.\)\{-}\.\d"hs=e  end="\_\D"he=s-1  oneline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strings
syn region octaveString  start=/'/  skip=/''/  end=/'/ contains=octaveStrError,@Spell keepend
syn region octaveString  start=/"/  skip=/\\"/ end=/"/ contains=octaveStrLineContinuation,octaveStrError,@Spell keepend
" Highlight run-away strings
syn region octaveStrError start=/$/ matchgroup=octaveString end=/'/ end=/"/ contained
" Allow backlash line continuations only in double-quoted strings
syn match octaveStrLineContinuation  "\\$" contained

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Numbers

" Integer numbers
syn match octaveNumber  "\<\d[0-9_]*\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
" Hex numbers
syn match octaveNumber  "\<0[xX]\x\%(\x\|_\)*\%([us]\%(8\|16\|32\|64\)\)\?\>"
" Binary numbers
syn match octaveNumber  "\<0[bB][01][01_]*\%([us]\%(8\|16\|32\|64\)\)\?\>"

" BAD numbers with decimal and then text (Example: 1.ab)
syn region octaveError  start="\<\d\+\.\ze\I"  end="\I"he=s-1  oneline
" Floating point number, with dot, optional exponent
syn match octaveFloat   "\<\d\+\.\%(\d\+\)\?\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
" Floating point number, starting with a dot, optional exponent
syn match octaveFloat   "\.\d\+\%([edED][-+]\?\d\+\)\?[ijIJ]\?\>"
" BAD numbers with double decimal points (Example: 1.2.3)
syn region octaveError  start="\<\d\+\.\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline
syn region octaveError  start="\<\d\+\.\d\+[eEdD][-+]\?\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Optionally highlight Operators

" Transpose must always match to prevent run-away strings
syn match octaveTransposeOperator   "[\])}[:alnum:]_]\@1<=\.\?'"
if exists("octave_highlight_operators")
  " special case for "~/" which is file, not logical operator
  syn match octaveLogicalOperator     "\%([&|!]\|\~\ze[^/]\)"
  syn match octaveArithmeticOperator  "\.\?[-+*/\\^]"
  syn match octaveRelationalOperator  "[=!~]="
  syn match octaveRelationalOperator  "[<>]=\?"
endif

" Improper Operators
" FIXME: More operator error highlighting would be nice
" Fortran exponeniation operator removed from Octave
syn match octaveError "\*\{2,}"
syn match octaveError "[&|]\{2}[&|*/\\^]\+"
syn match octaveError "[&|*/\\^][/\\^]\+"
syn match octaveError "[-+]\{2}[\-+&|!~*/\\^]\+"
syn match octaveError "[<>]\{2,}\|[<>=!~]=[<>=]\+\|[!~]\{2}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous formatting elements

" Delimiters
syn match octaveDelimiter  "[(){}[\]@]"

" Tabs, for possibly highlighting as errors
if exists("octave_highlight_tabs")
  syn match octaveTab  "\t"
endif

" Other special constructs
syn match octaveSemicolon  ";"
syn match octaveTilde  "\~\s*[,\]]"me=s+1

" Line continuations, order of matches is important here
syn match octaveLineContinuation  "\.\{3}$"
" Backlash line continuation is an error for Octave > 7.0
syn match octaveError  "\\$"
syn match octaveError  "\\\s*[#%].*$"
" Trailing characters after line continuation are an error
syn match octaveError  "\.\{3}.\+$"hs=s+3
" Line continuations w/comments are allowed
syn match octaveLineContinuation  "\.\{3}\s*[#%]"me=e-1

" Comments, order of matches is important here
syn keyword octaveFIXME contained  FIXME TODO
syn cluster AllComment contains=octaveFIXME,octaveTab,@Spell
syn match octaveComment  "[%#].*$" contains=@AllComment

syn region octaveBlockComment  start="^\s*\zs\z([#%]\){" end="^\s*\z1}"
      \ contains=octaveBadBlockCommentStart,@AllComment
      \ keepend extend
      \ nextgroup=octaveBadBlockCommentEnd skipwhite
" Highlight trailing characters after block comment start/end
syn region octaveBadBlockCommentStart  start=/[#%]{\zs\s*\S/ matchgroup=octaveBlockComment end=/$/ contained
syn match octaveBadBlockCommentEnd    "\S.*$"            contained

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apply highlight groups to syntax groups defined above

" Temporarily define command alias for use below
command -nargs=+ HiLink highlight default link <args>

" All keywords typically result in Statement class highlighting
HiLink octaveBeginKeyword             Statement
HiLink octaveElseKeyword              Statement
HiLink octaveEndKeyword               Statement
HiLink octaveOOKeyword                Statement
HiLink octaveLabel                    Label
HiLink octaveStatement                Statement
HiLink octaveVarKeyword               Keyword
HiLink octaveReserved                 Keyword

" Commands, Functions, and Get/Set functions
HiLink octaveCommand                  Statement
HiLink octaveGetFcn                   Constant
HiLink octaveROFcn                    Constant
HiLink octaveSetFcn                   Function
HiLink octaveFunction                 Function

" Identifiers
HiLink octaveStruct                   octaveUserVar
HiLink octaveString                   String
HiLink octaveStrError                 octaveError
HiLink octaveNumber                   Number
HiLink octaveFloat                    Number
HiLink octaveComment                  Comment
HiLink octaveBlockComment             Comment
HiLink octaveBadBlockCommentStart     octaveError 
HiLink octaveBadBlockCommentEnd       octaveError 
HiLink octaveFIXME                    Todo
HiLink octaveDelimiter                Identifier
HiLink octaveSemicolon                Special
HiLink octaveTilde                    Special
HiLink octaveLineContinuation         Special
HiLink octaveError                    Error

" Link all operators to one group which can be turned on/off below
HiLink octaveTransposeOperator        octaveOperator
HiLink octaveArithmeticOperator       octaveOperator
HiLink octaveRelationalOperator       octaveOperator
HiLink octaveLogicalOperator          octaveOperator

" Optional highlighting
if exists("octave_highlight_variables")
  highlight link octaveUserVar        PreProc
else
  highlight link octaveUserVar        None
endif
if exists("octave_highlight_operators")
  HiLink octaveOperator               Operator
endif
if exists("octave_highlight_tabs")
  " Link to a different class to show tabs not as Errors
  " Or add :hi link octave Tab <HIGHLIGHT_NAME> in .vimrc
  HiLink octaveTab                    octaveError
endif

delcommand HiLink

let b:current_syntax = "octave"

"EOF	vim: ts=2 et tw=80 sw=2 sts=0
