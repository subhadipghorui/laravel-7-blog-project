@extends('layouts.backend.app')
@push('header')
<script src="https://cdn.ckeditor.com/4.15.1/standard-all/ckeditor.js"></script>
@endpush
@section('content')
    <div id="right-panel" class="right-panel">
        <div class="content mt-3">
                <div class="row">
                    <div class="col-md-12">
                        @if ($errors->any())

                        @foreach ($errors->all() as $error)
                        <div class="alert  alert-danger alert-dismissible fade show" role="alert">
                            <span class="badge badge-pill badge-danger">Erorr</span> {{$error}}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        @endforeach

                        @endif

                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Update Post</strong>
                            </div>
                            <div class="card-body">
                                <form action="{{route('admin.post.update', $post->id)}}" method="POST" enctype="multipart/form-data" class="form-horizontal">
                                    @csrf
                                    @method('PUT')
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="title" class=" form-control-label">Title</label></div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="title" name="title" placeholder="Title" class="form-control" value="{{$post->title}}">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="select" class=" form-control-label">Category</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="category" id="select" class="form-control">
                                                @foreach ($categories as $category)
                                                <option value="{{$category->id}}" {{$post->category->id == $category->id ? "selected" : ""}}>{{$category->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="tag" class=" form-control-label">Tags</label></div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="tag" name="tags" placeholder="Tag (separated by ,)" class="form-control" value="@foreach($post->tags as $key=>$tag) {{$key+1 < count($post->tags) ? $tag->name. ',' : $tag->name}} @endforeach">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Status</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="checkbox">
                                                    <label for="checkbox1" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox1" name="status" value="1" class="form-check-input" {{$post->status == 1 ? 'checked':""}}>Published
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="image" class="form-control-file"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="textarea-input" class=" form-control-label">Body [ for embedde google drive image use :  https://drive.google.com/uc?export=view&id=file_id ]</label>
                                        <textarea name="body" id="editor" rows="9" placeholder="Content..." class="form-control">{{$post->body}}</textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-dot-circle-o"></i> Submit
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

<!-- .content -->
@endsection

@push('footer')
<script>
    CKEDITOR.addCss(
     'body.document-editor { margin: 0.5cm auto; border: 1px #D3D3D3 solid; border-radius: 5px; background: white; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); }' +
     'body.document-editor, div.cke_editable { width: 700px; padding: 1cm 2cm 2cm; } ' +
     'body.document-editor table td > p, div.cke_editable table td > p { margin-top: 0; margin-bottom: 0; padding: 4px 0 3px 5px;} ' +
     'blockquote { font-family: sans-serif, Arial, Verdana, "Trebuchet MS", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; } ');

   CKEDITOR.replace('editor', {
     extraPlugins: 'embed,autoembed,uploadimage,image2,codesnippet,colorbutton,font,justify,exportpdf,tableresize',
     codeSnippet_theme: 'monokai_sublime',
     height: 500,

     // Upload images to a CKFinder connector (note that the response type is set to JSON).
   //   uploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',

     // Configure your file manager integration. This example uses CKFinder 3 for PHP.
     filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
   filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
   filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
   filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token=',
   
     // The following options are not necessary and are used here for presentation purposes only.
     // They configure the Styles drop-down list and widgets to use classes.

     stylesSet: [{
         name: 'Narrow image',
         type: 'widget',
         widget: 'image',
         attributes: {
           'class': 'image-narrow'
         }
       },
       {
         name: 'Wide image',
         type: 'widget',
         widget: 'image',
         attributes: {
           'class': 'image-wide'
         }
       },
       
     ],

     // Load the default contents.css file plus customizations for this sample.
     contentsCss: [
       'http://cdn.ckeditor.com/4.15.1/full-all/contents.css',
       'https://ckeditor.com/docs/ckeditor4/4.15.1/examples/assets/css/widgetstyles.css'
     ],

     // Configure the Enhanced Image plugin to use classes instead of styles and to disable the
     // resizer (because image size is controlled by widget styles or the image takes maximum
     // 100% of the editor width).
     image2_alignClasses: ['image-align-left', 'image-align-center', 'image-align-right'],
     image2_disableResizer: true,

      // Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
      embed_provider: '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',
      bodyClass: 'document-editor',
   });
</script>
@endpush
