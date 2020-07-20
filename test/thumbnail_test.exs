defmodule ThumbnailTest do
  use ExUnit.Case

  @filename "test/images/cactus.jpg"
  @thumbname "test/images/cactus-thumb.jpg"

  alias Exexif.Data.Thumbnail
  import Exexif

  test "thumbnail fields are recognized properly" do
    metadata = exif_from_jpeg_file!(@filename)

    Thumbnail.to_image(@filename, metadata.thumbnail)
    assert File.exists?(@thumbname)
    File.rm!(@thumbname)

    assert %Thumbnail{
             thumbnail_offset: 631,
             thumbnail_size: 19_837
           } = metadata.thumbnail
  end

  # test "gps is printed in human readable manner" do
  #   {:ok, metadata} = exif_from_jpeg_buffer(@data)

  #   assert "#{metadata.gps}" == "41°23´16˝N,2°11´50˝E"

  # end
end
